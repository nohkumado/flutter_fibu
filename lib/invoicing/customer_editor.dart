import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

import '../generated/l10n.dart';
import '../rp_provider.dart';

/// Adds or changes a customer of the archive.
class CustomerEditor extends ConsumerStatefulWidget {
  /// The customer to change; null for a new one.
  final Customer? customer;

  const CustomerEditor({super.key, this.customer});

  @override
  ConsumerState<CustomerEditor> createState() => _CustomerEditorState();
}

class _CustomerEditorState extends ConsumerState<CustomerEditor> {
  final _form = GlobalKey<FormState>();
  late final _id = TextEditingController(text: widget.customer?.id ?? '');
  late final _name = TextEditingController(text: widget.customer?.name ?? '');
  late final _address = TextEditingController(text: widget.customer?.address.join('\n') ?? '');
  late final _country = TextEditingController(text: widget.customer?.country ?? 'FR');
  late final _vat = TextEditingController(text: widget.customer?.vatId ?? '');
  late bool _business = widget.customer?.business ?? false;
  late String _lang = widget.customer?.lang ?? 'fr';

  @override
  void dispose() {
    for (final c in [_id, _name, _address, _country, _vat]) {
      c.dispose();
    }
    super.dispose();
  }

  void _save() {
    if (!_form.currentState!.validate()) return;
    ref.read(invoiceProvider.notifier).saveCustomer(Customer(
          id: _id.text.trim(),
          name: _name.text.trim(),
          address: _address.text.split('\n').map((l) => l.trim()).where((l) => l.isNotEmpty).toList(),
          country: _country.text.trim().toUpperCase(),
          business: _business,
          vatId: _business ? _vat.text.trim() : '',
          lang: _lang,
        ));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final existing = ref.watch(invoiceProvider).store.customers;
    final isNew = widget.customer == null;
    return Scaffold(
      appBar: AppBar(title: Text(s.customer), actions: [IconButton(icon: const Icon(Icons.check), onPressed: _save)]),
      body: Form(
        key: _form,
        child: ListView(padding: const EdgeInsets.all(16), children: [
          TextFormField(
            controller: _name,
            decoration: InputDecoration(labelText: s.name),
            validator: (v) => (v ?? '').trim().isEmpty ? s.required : null,
            onChanged: (v) {
              if (isNew) _id.text = v.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]+'), '-');
            },
          ),
          TextFormField(
            controller: _id,
            enabled: isNew,
            decoration: InputDecoration(labelText: s.shortId),
            validator: (v) {
              final t = (v ?? '').trim();
              if (t.isEmpty) return s.required;
              if (isNew && existing.containsKey(t)) return s.idTaken;
              return null;
            },
          ),
          TextFormField(controller: _address, decoration: InputDecoration(labelText: s.address), minLines: 2, maxLines: 5),
          TextFormField(controller: _country, decoration: InputDecoration(labelText: s.country)),
          SwitchListTile(
            title: Text(s.business),
            value: _business,
            onChanged: (v) => setState(() => _business = v),
            contentPadding: EdgeInsets.zero,
          ),
          if (_business) TextFormField(controller: _vat, decoration: InputDecoration(labelText: s.vatId)),
          DropdownButtonFormField<String>(
          isExpanded: true,
            initialValue: _lang,
            decoration: InputDecoration(labelText: s.language),
            items: const [
              DropdownMenuItem(value: 'fr', child: Text('Français')),
              DropdownMenuItem(value: 'de', child: Text('Deutsch')),
              DropdownMenuItem(value: 'en', child: Text('English')),
            ],
            onChanged: (v) => setState(() => _lang = v ?? 'fr'),
          ),
        ]),
      ),
    );
  }
}
