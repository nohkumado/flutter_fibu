import 'dart:io';

import 'package:flutter_fibu/invoicing/invoice_files.dart';
import 'package:flutter_fibu/invoicing/invoice_notifier.dart';
import 'package:flutter_fibu/ledger/ledger_notifier.dart';
import 'package:flutter_fibu/rp_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nohfibu/nohfibu.dart';
import 'package:shared_preferences/shared_preferences.dart';

Book sampleBook() {
  final book = Book();
  for (final (n, d, r) in [('1001', 'Caisse', AccountType.Actif), ('1100', 'Clients', AccountType.Actif), ('4410', 'Recettes', AccountType.Produit)]) {
    book.kpl.put(n, Konto(name: n, desc: d, plan: book.kpl, accountType: r));
  }
  return book;
}

void main() {
  late Directory dir;
  late ProviderContainer c;

  setUp(() {
    SharedPreferences.setMockInitialValues({});
    dir = Directory.systemTemp.createTempSync('ledgerapp');
    File('${dir.path}/device').writeAsStringSync('tablet\n');
    c = ProviderContainer(overrides: [
      ledgerProvider.overrideWith(() => LedgerNotifier(base: InvoiceFiles(dir))),
      invoiceProvider.overrideWith(() => InvoiceNotifier(files: InvoiceFiles(dir))),
    ]);
  });
  tearDown(() {
    c.dispose();
    dir.deleteSync(recursive: true);
  });

  test('a history started from the open book records what the screens do', () async {
    await c.read(ledgerProvider.notifier).start('compta', from: sampleBook());
    final book = c.read(bookProvider);
    expect(book.kpl.get('1001')!.desc, 'Caisse', reason: 'the book shown is the history\'s');
    c.read(bookProvider.notifier).addLines([
      JrlLine(datum: DateTime(2026, 10, 1), kmin: book.kpl.get('4410'), kplu: book.kpl.get('1001'), desc: 'Cotisation', valuta: 3000),
    ]);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    // read back from the encrypted files, as on the next start
    final repo = await LedgerRepo.open(dir, 'compta', key: c.read(ledgerProvider).repo!.key);
    expect(repo.graph.length, 2);
    expect(repo.ledger.book.jrl.journal.single.desc, 'Cotisation');
    expect(File('${dir.path}/keys/compta.key').existsSync(), isTrue, reason: 'the desktop keeps the key in a file');
  });

  test('an invoice issued with a history: the device\'s series, booked into the same history', () async {
    // the history begins on the desktop; this tablet joins it
    final desktop = ChangeGraph()..record('desktop', Ledger.snapshot(book: sampleBook()), time: DateTime.utc(2026, 1, 1));
    final key = LedgerKey.generate();
    await ChangeFiles(Directory('${dir.path}/books/compta'), LedgerCipher(key)).save(desktop);
    await c.read(ledgerProvider.notifier).open('compta', key: key);
    const micro = Letterhead(id: 'micro', name: 'Jean Exemple', tax: TaxProfile(regime: 'franchise'),
        bookAccounts: {'receivable': '1100', 'revenue': '4410', 'bank': '1001'});
    c.read(invoiceProvider.notifier).saveLetterhead(micro);
    c.read(invoiceProvider.notifier).saveCustomer(const Customer(id: 'assoc', name: 'Association Exemple'));
    final invoices = c.read(invoiceProvider.notifier);
    final draft = invoices.draft(kind: InvoiceKind.invoice, letterhead: 'micro', customerId: 'assoc',
        items: const [InvoiceItem('Cours', 1, 6000)]);
    final (issued, lines) = invoices.issue(draft, book: c.read(bookProvider));
    c.read(bookProvider.notifier).addLines(lines);
    expect(issued.number, 'TABLET-${DateTime.now().year}-0001');
    await Future<void>.delayed(const Duration(milliseconds: 50));
    final again = (await LedgerRepo.open(dir, 'compta', key: key)).ledger;
    expect(again.store.documents.single.number, issued.number);
    expect(again.book.jrl.journal.single.desc, contains(issued.number));
    expect(again.letterheads.keys, ['micro'], reason: 'letterheads travel too');
  });

  test('syncing with the hub brings its changes onto the screen', () async {
    final key = LedgerKey.generate();
    final hub = ChangeGraph()..record('desktop', Ledger.snapshot(book: sampleBook()), time: DateTime.utc(2026, 1, 1));
    hub.record('desktop', [
      const ChangeOp('journal.add', {'date': '2026-10-01', 'minus': '4410', 'plus': '1001', 'desc': 'Banque', 'cur': 'EUR', 'valuta': 500}),
    ], time: DateTime.utc(2026, 10, 1));
    var invitation = SyncInvitation(host: '127.0.0.1', port: 0, book: 'compta', token: SyncInvitation.newToken(), key: key);
    final server = SyncServer(hub, invitation);
    await server.start();
    addTearDown(server.stop);
    invitation = SyncInvitation(host: '127.0.0.1', port: server.port, book: 'compta', token: invitation.token, key: key);

    final result = await c.read(ledgerProvider.notifier).sync(invitation);
    expect(result.received, 2);
    expect(c.read(bookProvider).jrl.journal.single.desc, 'Banque');
  });
}
