import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

import '../generated/l10n.dart';
import '../rp_provider.dart';
import 'customer_editor.dart';
import 'document_page.dart';

/// Writes a new offer or invoice: letterhead, customer, category, subject,
/// dates, items — the tax (franchise, reverse charge or rate) and the
/// totals shown as you type. Saved as a draft, or issued at once.
class DocumentEditor extends ConsumerStatefulWidget {
  final InvoiceKind kind;

  const DocumentEditor({super.key, required this.kind});

  @override
  ConsumerState<DocumentEditor> createState() => _DocumentEditorState();
}

class _Row {
  final what = TextEditingController();
  final quantity = TextEditingController(text: '1');
  final price = TextEditingController();

  InvoiceItem? get item {
    final cents = Amount.parseCents(price.text);
    if (what.text.trim().isEmpty || cents == null) return null;
    return InvoiceItem(what.text.trim(), num.tryParse(quantity.text.replaceAll(',', '.')) ?? 1, cents);
  }

  void dispose() {
    what.dispose();
    quantity.dispose();
    price.dispose();
  }
}

class _DocumentEditorState extends ConsumerState<DocumentEditor> {
  String? _letterhead;
  String? _customer;
  final _category = TextEditingController();
  final _title = TextEditingController();
  final _days = TextEditingController(text: '30');
  DateTime? _serviceDate;
  final List<_Row> _rows = [_Row()];

  @override
  void dispose() {
    for (final c in [_category, _title, _days]) {
      c.dispose();
    }
    for (final r in _rows) {
      r.dispose();
    }
    super.dispose();
  }

  List<InvoiceItem> get _items => _rows.map((r) => r.item).whereType<InvoiceItem>().toList();

  void _done(bool issue) {
    final notifier = ref.read(invoiceProvider.notifier);
    var doc = notifier.draft(
      kind: widget.kind,
      letterhead: _letterhead!,
      customerId: _customer!,
      items: _items,
      category: _category.text.trim(),
      title: _title.text.trim(),
      serviceDate: _serviceDate,
      days: int.tryParse(_days.text) ?? 30,
    );
    if (issue) doc = DocumentPage.issue(context, ref, doc);
    Navigator.of(context).pushReplacement(MaterialPageRoute<void>(builder: (_) => DocumentPage(number: doc.number, draft: doc)));
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final state = ref.watch(invoiceProvider);
    final offer = widget.kind == InvoiceKind.estimate;
    if (state.letterheads.isEmpty) {
      return Scaffold(appBar: AppBar(), body: Center(child: Text(s.noLetterhead)));
    }
    _letterhead ??= state.letterheads.keys.first;
    if (_customer != null && !state.store.customers.containsKey(_customer)) _customer = null;
    final lh = state.letterheads[_letterhead]!;
    final customer = _customer == null ? null : state.store.customers[_customer];
    final tax = customer == null
        ? null
        : TaxTreatment.of(lh.tax, customer, _category.text.trim(), lang: customer.lang, franchiseNote: lh.vatNote);
    final net = _items.fold(0, (sum, i) => sum + i.totalCents);
    final vatCents = ((tax?.rate ?? 0) * net).round();
    String eur(int c) => '${(c / 100).toStringAsFixed(2)} €';
    final ready = customer != null && _items.isNotEmpty;

    return Scaffold(
      appBar: AppBar(title: Text(offer ? s.newOffer : s.newInvoice)),
      body: ListView(padding: const EdgeInsets.all(16), children: [
        DropdownButtonFormField<String>(
          isExpanded: true,
          initialValue: _letterhead,
          decoration: InputDecoration(labelText: s.letterhead),
          items: [for (final l in state.letterheads.values) DropdownMenuItem(value: l.id, child: Text(l.name))],
          onChanged: (v) => setState(() => _letterhead = v),
        ),
        Row(children: [
          Expanded(
            child: DropdownButtonFormField<String>(
          isExpanded: true,
              initialValue: _customer,
              decoration: InputDecoration(labelText: s.customer),
              items: [for (final c in state.store.customers.values) DropdownMenuItem(value: c.id, child: Text(c.name))],
              onChanged: (v) => setState(() => _customer = v),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.person_add_alt),
            onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const CustomerEditor())),
          ),
        ]),
        TextField(controller: _category, decoration: InputDecoration(labelText: s.category), onChanged: (_) => setState(() {})),
        TextField(controller: _title, decoration: InputDecoration(labelText: s.subject)),
        Row(children: [
          Expanded(
            child: TextField(
              controller: _days,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: offer ? s.validDays : s.payDays),
            ),
          ),
          const SizedBox(width: 16),
          TextButton.icon(
            icon: const Icon(Icons.event),
            label: Text(_serviceDate == null ? s.serviceDate : FibuDate.show(_serviceDate!)),
            onPressed: () async {
              final d = await showDatePicker(
                  context: context, firstDate: DateTime(2000), lastDate: DateTime(2100), initialDate: _serviceDate ?? DateTime.now());
              if (d != null) setState(() => _serviceDate = d);
            },
          ),
        ]),
        const SizedBox(height: 16),
        Text(s.items, style: Theme.of(context).textTheme.titleMedium),
        for (final r in _rows)
          Row(children: [
            Expanded(flex: 5, child: TextField(controller: r.what, decoration: InputDecoration(labelText: s.description), onChanged: (_) => setState(() {}))),
            const SizedBox(width: 8),
            Expanded(
                flex: 2,
                child: TextField(
                    controller: r.quantity,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(labelText: s.quantity),
                    onChanged: (_) => setState(() {}))),
            const SizedBox(width: 8),
            Expanded(
                flex: 3,
                child: TextField(
                    controller: r.price,
                    keyboardType: const TextInputType.numberWithOptions(decimal: true),
                    decoration: InputDecoration(labelText: s.unitPrice),
                    onChanged: (_) => setState(() {}))),
            IconButton(
              icon: const Icon(Icons.remove_circle_outline),
              onPressed: _rows.length == 1
                  ? null
                  : () => setState(() {
                        _rows.remove(r);
                        r.dispose();
                      }),
            ),
          ]),
        Align(
          alignment: Alignment.centerLeft,
          child: TextButton.icon(icon: const Icon(Icons.add), label: Text(s.addItem), onPressed: () => setState(() => _rows.add(_Row()))),
        ),
        const Divider(),
        if (tax != null) ...[
          Text('${s.net}: ${eur(net)}   ${s.vat} ${(tax.rate * 100).toStringAsFixed(tax.rate * 100 % 1 == 0 ? 0 : 1)} %: ${eur(vatCents)}   '
              '${s.gross}: ${eur(net + vatCents)}', style: Theme.of(context).textTheme.titleSmall),
          if (tax.note.isNotEmpty) Padding(padding: const EdgeInsets.only(top: 4), child: Text(tax.note, style: Theme.of(context).textTheme.bodySmall)),
        ],
        const SizedBox(height: 16),
        Wrap(spacing: 12, alignment: WrapAlignment.end, children: [
          OutlinedButton(onPressed: ready ? () => _done(false) : null, child: Text(s.saveDraft)),
          FilledButton(onPressed: ready ? () => _done(true) : null, child: Text(s.issue)),
        ]),
      ]),
    );
  }
}
