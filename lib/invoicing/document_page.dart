import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

import '../generated/l10n.dart';
import '../rp_provider.dart';
import 'pay_dialog.dart';
import 'pdf_page.dart';
import 'status_chip.dart';

/// One offer or invoice: what it is, its history, and what can be done
/// next — issue a draft, record the answer to an offer, make the invoice of
/// an accepted offer, record a payment, write the reminder that is due —
/// and its PDF.
class DocumentPage extends ConsumerWidget {
  /// The document's number ("" for a draft, then [draft] is it).
  final String number;
  final Invoice? draft;

  const DocumentPage({super.key, required this.number, this.draft});

  /// Issues [doc]; for a letterhead that books, its lines go into the open
  /// book. Returns the issued document.
  static Invoice issue(BuildContext context, WidgetRef ref, Invoice doc) {
    final (issued, lines) = ref.read(invoiceProvider.notifier).issue(doc, book: ref.read(bookProvider));
    _booked(context, ref, issued, lines);
    return issued;
  }

  static void _booked(BuildContext context, WidgetRef ref, Invoice doc, List<JrlLine> lines) {
    final s = S.of(context);
    final lh = ref.read(invoiceProvider).letterheads[doc.letterhead];
    if (lines.isNotEmpty) {
      ref.read(bookProvider.notifier).addLines(lines);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s.booked2(lines.length))));
    } else if (lh != null && lh.books && doc.kind == InvoiceKind.invoice) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s.notBooked)));
    }
  }

  Invoice? _find(InvoiceStore store) {
    if (number.isNotEmpty) {
      for (final d in store.documents) {
        if (d.number == number && d.kind == (draft?.kind ?? d.kind)) return d;
      }
    }
    return draft != null && store.documents.contains(draft) ? draft : null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = S.of(context);
    final state = ref.watch(invoiceProvider);
    final doc = _find(state.store);
    if (doc == null) return Scaffold(appBar: AppBar(), body: const SizedBox());
    final notifier = ref.read(invoiceProvider.notifier);
    final customer = state.store.customerOf(doc);
    final letterhead = state.letterheads[doc.letterhead];
    final status = doc.status();
    final offer = doc.kind == InvoiceKind.estimate;
    final reminder = offer ? null : state.desk.remindersDue().where((r) => r.invoice == doc).firstOrNull;
    String eur(int c) => '${(c / 100).toStringAsFixed(2)} €';
    void replaceWith(Invoice d) => Navigator.of(context)
        .pushReplacement(MaterialPageRoute<void>(builder: (_) => DocumentPage(number: d.number, draft: d)));

    Future<void> payDialog() async {
      final cents = await showDialog<int>(context: context, builder: (_) => PayDialog(openCents: doc.openCents));
      if (cents == null || cents <= 0 || !context.mounted) return;
      _booked(context, ref, doc, notifier.pay(doc, cents, book: ref.read(bookProvider)));
    }

    final pdfTitle = doc.number.isEmpty ? (offer ? s.newOffer : s.newInvoice) : doc.number;
    return Scaffold(
      appBar: AppBar(
        title: Text('${offer ? s.offers : s.invoices} ${doc.number}'),
        actions: [
          if (letterhead != null)
            IconButton(
              icon: const Icon(Icons.picture_as_pdf_outlined),
              tooltip: s.pdf,
              onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
                  builder: (_) => PdfPage(title: pdfTitle, makePdf: () => InvoicePdf.render(doc, letterhead, customer: customer)))),
            ),
        ],
      ),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        Row(children: [
          Expanded(child: Text(customer.name, style: Theme.of(context).textTheme.titleLarge)),
          StatusChip(status),
        ]),
        if (doc.title.isNotEmpty) Text(doc.title),
        Text('${FibuDate.show(doc.date)} → ${FibuDate.show(doc.payDate)}'
            '${doc.source.isEmpty ? '' : '   (${doc.source})'}'),
        const Divider(),
        for (final i in doc.items)
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            title: Text(i.denomination),
            subtitle: Text('${i.quantity} × ${eur(i.unitPriceCents)}'),
            trailing: Text(eur(i.totalCents)),
          ),
        const Divider(),
        Text('${s.net} ${eur(doc.netCents)}   ${s.vat} ${eur(doc.vatCents)}   ${s.gross} ${eur(doc.grossCents)}',
            style: Theme.of(context).textTheme.titleSmall),
        if (doc.taxNote.isNotEmpty) Text(doc.taxNote, style: Theme.of(context).textTheme.bodySmall),
        if (!offer && doc.paidCents > 0) Text('${s.pay}: ${eur(doc.paidCents)} — ${eur(doc.openCents)}'),
        const SizedBox(height: 12),
        Wrap(spacing: 8, runSpacing: 8, children: [
          if (status == InvoiceStatus.draft) ...[
            FilledButton(onPressed: () => replaceWith(issue(context, ref, doc)), child: Text(s.issue)),
            OutlinedButton(
              onPressed: () {
                notifier.dropDraft(doc);
                Navigator.of(context).pop();
              },
              child: Text(s.deleteDraft),
            ),
          ],
          if (status == InvoiceStatus.open) ...[
            FilledButton(onPressed: () => notifier.answer(doc, accepted: true), child: Text(s.accept)),
            OutlinedButton(onPressed: () => notifier.answer(doc, accepted: false), child: Text(s.refuse)),
          ],
          if (status == InvoiceStatus.accepted)
            FilledButton(
              onPressed: () {
                final (invoice, lines) = notifier.invoiceOffer(doc, book: ref.read(bookProvider));
                _booked(context, ref, invoice, lines);
                replaceWith(invoice);
              },
              child: Text(s.makeInvoice),
            ),
          if (status == InvoiceStatus.unpaid || status == InvoiceStatus.overdue)
            FilledButton(onPressed: payDialog, child: Text(s.pay)),
          if (reminder != null && letterhead != null)
            OutlinedButton(
              onPressed: () async {
                await Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (_) => PdfPage(
                        title: '${doc.number}_${reminder.level}',
                        makePdf: () => ReminderPdf.render(reminder, letterhead, customer))));
                notifier.reminderSent(reminder);
              },
              child: Text(s.remind(reminder.level)),
            ),
        ]),
        const SizedBox(height: 16),
        Text(s.history, style: Theme.of(context).textTheme.titleMedium),
        for (final e in doc.events.reversed)
          ListTile(
            dense: true,
            contentPadding: EdgeInsets.zero,
            leading: Text(FibuDate.show(e.date)),
            title: Text('${e.kind.name}${e.kind == DocumentEventKind.paid ? ' ${eur(e.value)}' : e.value != 0 ? ' ${e.value}' : ''}'),
            subtitle: e.note.isEmpty ? null : Text(e.note),
          ),
      ]),
    );
  }
}
