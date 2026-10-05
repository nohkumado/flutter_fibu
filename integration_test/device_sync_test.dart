// Books & devices on a real device, against a hub on the desktop:
//
//   ledger -B devicetest --base /tmp/hub init --from …/compta2018.csv --letterheads …
//   ledger -B devicetest --base /tmp/hub serve --port 4711
//   flutter test integration_test/device_sync_test.dart -d <device> \
//     --dart-define=INVITATION='nohfibu://sync?…' --dart-define=DEVICE=pixel8
//
// Pairs (the key into the device's secure storage), receives the book,
// issues and books an invoice in the device's series, syncs it back, makes
// and restores a backup on the device — then removes the test book.
import 'dart:io';


import 'package:flutter_fibu/invoicing/invoice_files.dart';
import 'package:flutter_fibu/invoicing/invoice_notifier.dart';
import 'package:flutter_fibu/ledger/ledger_keys.dart';
import 'package:flutter_fibu/ledger/ledger_notifier.dart';
import 'package:flutter_fibu/rp_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:nohfibu/nohfibu.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  const invitationText = String.fromEnvironment('INVITATION');
  const deviceName = String.fromEnvironment('DEVICE', defaultValue: 'device');

  testWidgets('pair, receive, issue, sync back, back up — on this device', (tester) async {
    expect(invitationText, isNotEmpty, reason: '--dart-define=INVITATION=…');
    final invitation = SyncInvitation.parse(invitationText);
    final files = await InvoiceFiles.locate();
    files.base.createSync(recursive: true);
    File('${files.base.path}/device').writeAsStringSync('$deviceName\n');
    final c = ProviderContainer(overrides: [
      ledgerProvider.overrideWith(() => LedgerNotifier(base: files)),
      invoiceProvider.overrideWith(() => InvoiceNotifier(files: files)),
    ]);
    addTearDown(c.dispose);
    final report = <String>[];

    try {
      // 1. pair and receive
      var watch = Stopwatch()..start();
      final first = await c.read(ledgerProvider.notifier).sync(invitation);
      report.add('pair + first sync: $first in ${watch.elapsedMilliseconds} ms');
      final book = c.read(bookProvider);
      expect(book.kpl.get('1100'), isNotNull, reason: 'the book arrived');
      report.add('book received: ${book.kpl.accounts().length} accounts, ${book.jrl.count()} journal lines');

      // 2. the key is in the device's secure storage
      final stored = await LedgerKeys(files.base).read(invitation.book);
      expect(stored?.toBase64(), invitation.key.toBase64());
      report.add('key in secure storage: ${Platform.isAndroid ? 'Android Keystore' : 'key file'}');

      // 3. an invoice in this device's series, booked
      final invoices = c.read(invoiceProvider.notifier);
      await tester.pump(const Duration(milliseconds: 200));
      expect(c.read(invoiceProvider).letterheads.containsKey('micro'), isTrue, reason: 'the letterhead came with the history');
      invoices.saveCustomer(Customer(id: 'test-$deviceName', name: 'Client test $deviceName'));
      final draft = invoices.draft(
          kind: InvoiceKind.invoice, letterhead: 'micro', customerId: 'test-$deviceName',
          items: const [InvoiceItem('Test sur appareil', 1, 4200)]);
      final (issued, lines) = invoices.issue(draft, book: c.read(bookProvider));
      c.read(bookProvider.notifier).addLines(lines);
      expect(issued.number, startsWith('${deviceName.toUpperCase()}-'));
      expect(lines, isNotEmpty, reason: 'the letterhead books');
      report.add('issued ${issued.number}, booked ${lines.length} line(s)');
      await tester.pump(const Duration(milliseconds: 300));

      // 4. back to the hub
      watch = Stopwatch()..start();
      final second = await c.read(ledgerProvider.notifier).sync(invitation);
      expect(second.sent, greaterThanOrEqualTo(1));
      report.add('sync back: $second in ${watch.elapsedMilliseconds} ms');

      // 5. a backup made and restored on this device
      watch = Stopwatch()..start();
      final backup = await c.read(ledgerProvider.notifier).backup('a test passphrase');
      final made = watch.elapsedMilliseconds;
      final restored = await LedgerBackup.restore(backup, 'a test passphrase');
      expect(restored.length, c.read(ledgerProvider).repo!.graph.length);
      report.add('backup: made in $made ms, restored in ${watch.elapsedMilliseconds - made} ms (${backup.length} bytes)');
    } finally {
      // leave the device as it was: back to the plain files (the app must
      // not reopen the test book at its next start), the test key and the
      // test book go
      await c.read(ledgerProvider.notifier).close();
      await LedgerKeys(files.base).delete(invitation.book);
      final dir = Directory('${files.base.path}/books/${invitation.book}');
      if (dir.existsSync()) dir.deleteSync(recursive: true);
      // ignore: avoid_print
      print('DEVICE REPORT ($deviceName):\n  ${report.join('\n  ')}');
    }
  });
}
