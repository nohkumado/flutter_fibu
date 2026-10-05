import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

import '../generated/l10n.dart';
import '../rp_provider.dart';

/// The book's key and the password manager: shown as a login (user
/// `nohfibu:<book>`, the key as password) so that Bitwarden — or any
/// autofill service — offers to save it; and the other way, a field the
/// password manager can fill to bring the key to a new device.
class KeyPage extends ConsumerStatefulWidget {
  final String book;

  /// Show the key to save it (true), or ask for it (false).
  final bool save;

  const KeyPage({super.key, required this.book, required this.save});

  @override
  ConsumerState<KeyPage> createState() => _KeyPageState();
}

class _KeyPageState extends ConsumerState<KeyPage> {
  late final _user = TextEditingController(text: 'nohfibu:${widget.book}');
  late final _key = TextEditingController(text: widget.save ? ref.read(ledgerProvider).repo?.key.toBase64() ?? '' : '');
  String? _error;

  @override
  void dispose() {
    _user.dispose();
    _key.dispose();
    super.dispose();
  }

  Future<void> _done() async {
    final s = S.of(context);
    if (widget.save) {
      // the autofill service (Bitwarden) offers to save user + password now
      TextInput.finishAutofillContext();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s.keySave)));
      return;
    }
    try {
      final key = LedgerKey.fromBase64(_key.text);
      TextInput.finishAutofillContext(shouldSave: false);
      await ref.read(ledgerProvider.notifier).open(widget.book, key: key);
      if (mounted) Navigator.of(context).pop();
    } catch (e) {
      setState(() => _error = '$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(widget.save ? s.keyToManager : s.keyEnter)),
      body: AutofillGroup(
        child: ListView(padding: const EdgeInsets.all(16), children: [
          Text(s.keyHint),
          const SizedBox(height: 16),
          TextField(
            controller: _user,
            // editable on purpose: autofill services only take fields a
            // person could have typed in
            autofillHints: const [AutofillHints.username],
            decoration: const InputDecoration(labelText: 'Login'),
          ),
          TextField(
            controller: _key,
            obscureText: !widget.save,
            autofillHints: [widget.save ? AutofillHints.newPassword : AutofillHints.password],
            decoration: InputDecoration(labelText: s.keyEnter, errorText: _error),
            style: const TextStyle(fontFamily: 'monospace'),
          ),
          const SizedBox(height: 16),
          Align(alignment: Alignment.centerRight, child: FilledButton(onPressed: _done, child: Text(s.keySave))),
        ]),
      ),
    );
  }
}
