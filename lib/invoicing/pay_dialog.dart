import 'package:flutter/material.dart';
import 'package:nohfibu/nohfibu.dart';

import '../generated/l10n.dart';

/// Asks how much was paid (the open amount offered); pops the amount in
/// cents, or null. Owns its text field, so it lives as long as the dialog.
class PayDialog extends StatefulWidget {
  final int openCents;

  const PayDialog({super.key, required this.openCents});

  @override
  State<PayDialog> createState() => _PayDialogState();
}

class _PayDialogState extends State<PayDialog> {
  late final _amount = TextEditingController(text: (widget.openCents / 100).toStringAsFixed(2));

  @override
  void dispose() {
    _amount.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final m = MaterialLocalizations.of(context);
    return AlertDialog(
      title: Text(s.pay),
      content: TextField(
        controller: _amount,
        autofocus: true,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(labelText: s.amount),
      ),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(m.cancelButtonLabel)),
        FilledButton(onPressed: () => Navigator.pop(context, Amount.parseCents(_amount.text)), child: Text(m.okButtonLabel)),
      ],
    );
  }
}
