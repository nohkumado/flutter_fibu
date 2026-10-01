import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

import '../generated/l10n.dart';
import '../rp_provider.dart';

/// Adds or changes a letterhead: who issues, legal ids, the tax regime
/// (franchise or VAT, rates by category, reverse charge by category),
/// bank, reminders and, optionally, the accounts invoices are booked on.
/// Saved as `<id>.yaml`, the same file the facture command line reads.
class LetterheadEditor extends ConsumerStatefulWidget {
  final Letterhead? letterhead;

  const LetterheadEditor({super.key, this.letterhead});

  @override
  ConsumerState<LetterheadEditor> createState() => _LetterheadEditorState();
}

class _LetterheadEditorState extends ConsumerState<LetterheadEditor> {
  final _form = GlobalKey<FormState>();
  late final Letterhead? _l = widget.letterhead;
  late final Map<String, TextEditingController> _c = {
    'id': TextEditingController(text: _l?.id ?? ''),
    'name': TextEditingController(text: _l?.name ?? ''),
    'address': TextEditingController(text: _l?.address.join('\n') ?? ''),
    'country': TextEditingController(text: _l?.tax.country ?? 'FR'),
    'phone': TextEditingController(text: _l?.phone ?? ''),
    'email': TextEditingController(text: _l?.email ?? ''),
    'siret': TextEditingController(text: _l?.siret ?? ''),
    'vatId': TextEditingController(text: _l?.vatId ?? ''),
    'taxNumber': TextEditingController(text: _l?.taxNumber ?? ''),
    'rate': TextEditingController(text: _pct(_l?.tax.rate ?? 0.2)),
    'rates': TextEditingController(text: _l?.tax.rates.entries.map((e) => '${e.key}=${_pct(e.value)}').join(', ') ?? ''),
    'reverse': TextEditingController(text: _l?.tax.reverseCharge.join(', ') ?? ''),
    'vatNote': TextEditingController(text: _l?.vatNote ?? ''),
    'bankName': TextEditingController(text: _l?.bankName ?? ''),
    'iban': TextEditingController(text: _l?.iban ?? ''),
    'bic': TextEditingController(text: _l?.bic ?? ''),
    'footer': TextEditingController(text: _l?.footer ?? ''),
    'logo': TextEditingController(text: _l?.logo ?? ''),
    'reminderDays': TextEditingController(text: (_l?.reminderDays ?? const [15, 30, 45]).join(', ')),
    'penalty': TextEditingController(text: _pct(_l?.penaltyRate ?? 0)),
    'fee': TextEditingController(text: ((_l?.recoveryFeeCents ?? 4000) / 100).toStringAsFixed(2)),
    'receivable': TextEditingController(text: _l?.bookAccounts['receivable'] ?? ''),
    'revenue': TextEditingController(text: _l?.bookAccounts['revenue'] ?? ''),
    'vat': TextEditingController(text: _l?.bookAccounts['vat'] ?? ''),
    'bank': TextEditingController(text: _l?.bookAccounts['bank'] ?? ''),
  };
  late String _regime = _l?.tax.regime ?? 'franchise';

  static String _pct(double v) {
    final p = v * 100;
    return p == p.roundToDouble() ? p.round().toString() : p.toStringAsFixed(2);
  }

  static double _fromPct(String t) => (double.tryParse(t.trim().replaceAll(',', '.')) ?? 0) / 100;

  @override
  void dispose() {
    for (final c in _c.values) {
      c.dispose();
    }
    super.dispose();
  }

  String _t(String k) => _c[k]!.text.trim();

  Future<void> _pickLogo() async {
    final picked = await FilePicker.pickFile(type: FileType.image);
    if (picked == null) return;
    final files = ref.read(invoiceProvider).files!;
    files.letterheads.createSync(recursive: true);
    final id = _t('id').isEmpty ? 'logo' : _t('id');
    final target = File('${files.letterheads.path}/$id-logo.${picked.name.split('.').last}');
    target.writeAsBytesSync(await picked.readAsBytes());
    setState(() => _c['logo']!.text = target.path);
  }

  void _save() {
    if (!_form.currentState!.validate()) return;
    List<String> list(String k) => _t(k).split(RegExp(r'[,\n]')).map((e) => e.trim()).where((e) => e.isNotEmpty).toList();
    final rates = <String, double>{
      for (final pair in list('rates'))
        if (pair.contains('=')) pair.split('=')[0].trim(): _fromPct(pair.split('=')[1]),
    };
    final accounts = <String, String>{
      for (final k in ['receivable', 'revenue', 'vat', 'bank'])
        if (_t(k).isNotEmpty) k: _t(k),
    };
    ref.read(invoiceProvider.notifier).saveLetterhead(Letterhead(
          id: _t('id'),
          name: _t('name'),
          address: _c['address']!.text.split('\n').map((l) => l.trim()).where((l) => l.isNotEmpty).toList(),
          phone: _t('phone'),
          email: _t('email'),
          siret: _t('siret'),
          vatId: _t('vatId'),
          taxNumber: _t('taxNumber'),
          vatNote: _t('vatNote'),
          bankName: _t('bankName'),
          iban: _t('iban'),
          bic: _t('bic'),
          footer: _t('footer'),
          logo: _t('logo'),
          font: _l?.font ?? '',
          tax: TaxProfile(
            country: _t('country').toUpperCase(),
            regime: _regime,
            rate: _fromPct(_t('rate')),
            rates: rates,
            reverseCharge: list('reverse'),
          ),
          reminderDays: [for (final d in list('reminderDays')) int.tryParse(d) ?? 0].where((d) => d > 0).toList(),
          penaltyRate: _fromPct(_t('penalty')),
          recoveryFeeCents: Amount.parseCents(_t('fee')) ?? 4000,
          bookAccounts: accounts,
        ));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final isNew = widget.letterhead == null;
    final existing = ref.watch(invoiceProvider).letterheads;
    Widget field(String k, String label, {int lines = 1, bool required = false, TextInputType? keyboard}) => TextFormField(
          controller: _c[k],
          decoration: InputDecoration(labelText: label),
          minLines: lines,
          maxLines: lines == 1 ? 1 : lines + 3,
          keyboardType: keyboard,
          validator: required ? (v) => (v ?? '').trim().isEmpty ? s.required : null : null,
        );
    Widget heading(String t) => Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 4),
          child: Text(t, style: Theme.of(context).textTheme.titleMedium),
        );
    const number = TextInputType.numberWithOptions(decimal: true);
    return Scaffold(
      appBar: AppBar(
        title: Text(s.letterhead),
        actions: [
          if (!isNew)
            IconButton(
              icon: const Icon(Icons.delete_outline),
              tooltip: s.delete,
              onPressed: () {
                ref.read(invoiceProvider.notifier).deleteLetterhead(widget.letterhead!.id);
                Navigator.of(context).pop();
              },
            ),
          IconButton(icon: const Icon(Icons.check), onPressed: _save),
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(padding: const EdgeInsets.all(16), children: [
          TextFormField(
            controller: _c['id'],
            enabled: isNew,
            decoration: InputDecoration(labelText: s.shortId),
            validator: (v) {
              final t = (v ?? '').trim();
              if (!RegExp(r'^[a-zA-Z0-9_.-]+$').hasMatch(t)) return s.required;
              if (isNew && existing.containsKey(t)) return s.idTaken;
              return null;
            },
          ),
          field('name', s.name, required: true),
          field('address', s.address, lines: 2),
          field('country', s.country),
          field('phone', s.phone),
          field('email', s.email),
          field('siret', s.siret),
          field('vatId', s.vatId),
          field('taxNumber', s.taxNumber),
          heading(s.regime),
          RadioGroup<String>(
            groupValue: _regime,
            onChanged: (v) => setState(() => _regime = v ?? 'franchise'),
            child: Column(children: [
              RadioListTile(value: 'franchise', title: Text(s.franchise), contentPadding: EdgeInsets.zero),
              RadioListTile(value: 'vat', title: Text(s.vatRegime), contentPadding: EdgeInsets.zero),
            ]),
          ),
          if (_regime == 'vat') ...[
            field('rate', s.rate, keyboard: number),
            field('rates', s.rates),
          ] else
            field('vatNote', s.vatNote),
          field('reverse', s.reverseCharge),
          heading(s.bank),
          field('bankName', s.bank),
          field('iban', 'IBAN'),
          field('bic', 'BIC'),
          field('footer', s.footer, lines: 2),
          Row(children: [
            Expanded(child: field('logo', 'Logo')),
            IconButton(icon: const Icon(Icons.image_outlined), onPressed: _pickLogo),
          ]),
          heading(s.reminders),
          field('reminderDays', s.reminderDays),
          field('penalty', s.penaltyRate, keyboard: number),
          field('fee', s.recoveryFee, keyboard: number),
          heading(s.booking),
          field('receivable', s.receivable, keyboard: TextInputType.number),
          field('revenue', s.revenue, keyboard: TextInputType.number),
          field('vat', s.vatAccount, keyboard: TextInputType.number),
          field('bank', s.bankAccount, keyboard: TextInputType.number),
        ]),
      ),
    );
  }
}
