import 'package:flutter/material.dart';

import '../generated/l10n.dart';

/// Asks a passphrase — twice when [confirm] (a new backup) — and pops it,
/// or null. Owns its fields, so they live as long as the dialog.
class PassphraseDialog extends StatefulWidget {
  final String title;
  final bool confirm;

  const PassphraseDialog({super.key, required this.title, this.confirm = false});

  @override
  State<PassphraseDialog> createState() => _PassphraseDialogState();
}

class _PassphraseDialogState extends State<PassphraseDialog> {
  final _first = TextEditingController();
  final _second = TextEditingController();
  String? _error;

  @override
  void dispose() {
    _first.dispose();
    _second.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final m = MaterialLocalizations.of(context);
    return AlertDialog(
      title: Text(widget.title),
      content: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(controller: _first, obscureText: true, autofocus: true, decoration: InputDecoration(labelText: s.passphrase)),
        if (widget.confirm)
          TextField(controller: _second, obscureText: true, decoration: InputDecoration(labelText: s.passphraseAgain, errorText: _error)),
      ]),
      actions: [
        TextButton(onPressed: () => Navigator.pop(context), child: Text(m.cancelButtonLabel)),
        FilledButton(
          onPressed: () {
            if (_first.text.isEmpty) return;
            if (widget.confirm && _first.text != _second.text) {
              setState(() => _error = s.passphrasesDiffer);
              return;
            }
            Navigator.pop(context, _first.text);
          },
          child: Text(m.okButtonLabel),
        ),
      ],
    );
  }
}
