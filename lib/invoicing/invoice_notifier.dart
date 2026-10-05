import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

import 'invoice_files.dart';
import 'invoice_state.dart';
import '../rp_provider.dart';

/// Offers, invoices, customers and letterheads in the app: every change
/// goes through nohfibu's [InvoiceDesk] (the same workflow as the facture
/// command line) and is saved at once.
class InvoiceNotifier extends Notifier<InvoiceState> {
  InvoiceNotifier({this.files});

  /// Where the files are (tests); else [InvoiceFiles.locate].
  final InvoiceFiles? files;

  @override
  InvoiceState build() {
    final ledger = ref.watch(ledgerProvider.select((s) => s.ledger));
    if (files != null) return _read(files!, ledger);
    InvoiceFiles.locate().then((f) {
      if (ref.mounted) state = _read(f, ledger);
    });
    return InvoiceState(store: ledger?.store ?? InvoiceStore());
  }

  /// From the files — or, with a book's history open, its archive and
  /// letterheads (the files' letterheads too).
  InvoiceState _read(InvoiceFiles f, Ledger? ledger) {
    if (ledger == null) {
      return InvoiceState(files: f, store: InvoiceStore.load(f.store), letterheads: Letterhead.loadAll(f.letterheads));
    }
    return InvoiceState(
      files: f,
      store: ledger.store,
      letterheads: {
        for (final e in ledger.letterheads.entries) e.key: Letterhead.parse(e.value, id: e.key),
        ...Letterhead.loadAll(f.letterheads),
      },
      history: true,
      series: ref.read(ledgerProvider).repo?.series ?? '',
    );
  }

  void _changed() {
    if (state.history) {
      ref.read(ledgerProvider.notifier).commit();
    } else {
      state.store.save(state.files!.store);
    }
    state = state.copy();
  }

  void saveLetterhead(Letterhead letterhead) {
    letterhead.save(state.files!.letterheads);
    state.letterheads[letterhead.id] = letterhead;
    if (state.history) ref.read(ledgerProvider.notifier).putLetterhead(letterhead);
    state = state.copy();
  }

  void deleteLetterhead(String id) {
    final f = state.files!.letterheads;
    for (final ext in ['yaml', 'yml']) {
      final file = f.listSync().where((e) => e.path.endsWith('/$id.$ext'));
      for (final e in file) {
        e.deleteSync();
      }
    }
    state.letterheads.remove(id);
    state = state.copy();
  }

  void saveCustomer(Customer customer) {
    state.store.customers[customer.id] = customer;
    _changed();
  }

  /// A new draft offer or invoice.
  Invoice draft({
    required InvoiceKind kind,
    required String letterhead,
    required String customerId,
    required List<InvoiceItem> items,
    String category = '',
    String title = '',
    DateTime? date,
    DateTime? serviceDate,
    int days = 30,
  }) {
    final doc = state.desk.draft(
        kind: kind, letterhead: letterhead, customerId: customerId, items: items,
        category: category, title: title, date: date, serviceDate: serviceDate, days: days);
    _changed();
    return doc;
  }

  /// Removes a draft (an issued document is never deleted).
  void dropDraft(Invoice doc) {
    if (doc.status() != InvoiceStatus.draft) throw StateError('${doc.number} is issued');
    state.store.documents.remove(doc);
    _changed();
  }

  /// Issues [doc]; the journal lines for the open [book], when its
  /// letterhead books.
  (Invoice, List<JrlLine>) issue(Invoice doc, {Book? book}) {
    final result = state.desk.issue(doc, date: DateTime.now(), book: _bookIfBooking(doc, book));
    _changed();
    return result;
  }

  void answer(Invoice offer, {required bool accepted}) {
    state.desk.answer(offer, accepted: accepted, date: DateTime.now());
    _changed();
  }

  (Invoice, List<JrlLine>) invoiceOffer(Invoice offer, {Book? book}) {
    final result = state.desk.invoiceOffer(offer, date: DateTime.now(), book: _bookIfBooking(offer, book));
    _changed();
    return result;
  }

  List<JrlLine> pay(Invoice invoice, int cents, {DateTime? date, String note = '', Book? book}) {
    final lines = state.desk.pay(invoice, cents, date: date ?? DateTime.now(), note: note, book: _bookIfBooking(invoice, book));
    _changed();
    return lines;
  }

  void reminderSent(Reminder reminder) {
    state.desk.sent(reminder);
    _changed();
  }

  /// The book only when it has the letterhead's accounts — an empty or
  /// another book is left alone.
  Book? _bookIfBooking(Invoice doc, Book? book) {
    final lh = state.letterheads[doc.letterhead];
    if (book == null || lh == null || !lh.books) return null;
    final known = lh.bookAccounts.values.every((n) => book.kpl.get(n)?.valid() ?? false);
    return known ? book : null;
  }
}
