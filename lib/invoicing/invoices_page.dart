import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

import '../generated/l10n.dart';
import '../rp_provider.dart';
import 'document_editor.dart';
import 'document_page.dart';
import 'status_chip.dart';

/// Offers and invoices: what needs attention first (reminders due), then
/// every document, newest first, with its status. + writes a new one.
class InvoicesPage extends ConsumerWidget {
  const InvoicesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = S.of(context);
    final state = ref.watch(invoiceProvider);
    if (!state.ready) return const Center(child: CircularProgressIndicator());
    final docs = state.store.documents.toList()..sort((a, b) => b.date.compareTo(a.date));
    final due = state.letterheads.isEmpty ? const <Reminder>[] : state.desk.remindersDue();
    String eur(int c) => '${(c / 100).toStringAsFixed(2)} €';
    void open(Invoice d) =>
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => DocumentPage(number: d.number, draft: d)));
    void write(InvoiceKind kind) =>
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => DocumentEditor(kind: kind)));

    return Stack(children: [
      ListView(padding: const EdgeInsets.only(bottom: 88), children: [
        if (due.isNotEmpty)
          Card(
            color: Theme.of(context).colorScheme.errorContainer,
            child: ListTile(
              leading: const Icon(Icons.notification_important_outlined),
              title: Text(s.remindersDue(due.length)),
              subtitle: Text(due.map((r) => '${r.invoice.number} (${r.level})').join(', ')),
              onTap: () => open(due.first.invoice),
            ),
          ),
        if (docs.isEmpty) Padding(padding: const EdgeInsets.all(24), child: Center(child: Text(s.noDocuments))),
        for (final d in docs)
          ListTile(
            leading: Icon(d.kind == InvoiceKind.estimate ? Icons.request_quote_outlined : Icons.receipt_long_outlined),
            title: Text('${d.number.isEmpty ? '—' : d.number}  ${state.store.customerOf(d).name}'),
            subtitle: Text('${FibuDate.show(d.date)} · ${eur(d.grossCents)}'),
            trailing: StatusChip(d.status()),
            onTap: () => open(d),
          ),
      ]),
      Positioned(
        right: 16,
        bottom: 16,
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end, children: [
          FloatingActionButton.extended(
            heroTag: 'offer',
            icon: const Icon(Icons.request_quote_outlined),
            label: Text(s.newOffer),
            onPressed: () => write(InvoiceKind.estimate),
          ),
          const SizedBox(height: 12),
          FloatingActionButton.extended(
            heroTag: 'invoice',
            icon: const Icon(Icons.receipt_long_outlined),
            label: Text(s.newInvoice),
            onPressed: () => write(InvoiceKind.invoice),
          ),
        ]),
      ),
    ]);
  }
}
