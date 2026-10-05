import 'dart:convert';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:linux_qr_reader/linux_qr_reader.dart';
import 'package:nohfibu/nohfibu.dart';

import '../generated/l10n.dart';
import '../rp_provider.dart';
import 'hub_panel.dart';
import 'key_page.dart';
import 'passphrase_dialog.dart';

/// Books & devices: the open book's history — start one from the plain
/// files, sync with the desktop (scan its code) or be the hub, back up and
/// restore under a passphrase, keep the key in the password manager, see
/// what was changed on two devices at the same time.
class LedgerPage extends ConsumerStatefulWidget {
  const LedgerPage({super.key});

  @override
  ConsumerState<LedgerPage> createState() => _LedgerPageState();
}

class _LedgerPageState extends ConsumerState<LedgerPage> {
  final _bookName = TextEditingController(text: 'compta${DateTime.now().year}');
  final _invitation = TextEditingController();
  bool _busy = false;

  @override
  void dispose() {
    _bookName.dispose();
    _invitation.dispose();
    super.dispose();
  }

  /// Runs [action] with a busy indicator; its message (or error) as snack.
  Future<void> _run(Future<String?> Function() action) async {
    setState(() => _busy = true);
    String? message;
    try {
      message = await action();
    } catch (e) {
      message = '$e';
    }
    if (!mounted) return;
    setState(() => _busy = false);
    if (message != null) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  Future<String?> _sync(String text) async {
    final result = await ref.read(ledgerProvider.notifier).sync(SyncInvitation.parse(text));
    if (!mounted) return null;
    return S.of(context).synced(result.received, result.sent);
  }

  Future<String?> _backup() async {
    final s = S.of(context);
    final pass = await showDialog<String>(context: context, builder: (_) => PassphraseDialog(title: s.backup, confirm: true));
    if (pass == null) return null;
    final book = ref.read(ledgerProvider).book!;
    final text = await ref.read(ledgerProvider.notifier).backup(pass);
    final saved = await FilePicker.saveFile(
        fileName: '$book-${FibuDate.show(DateTime.now())}.nohfibu-backup', bytes: Uint8List.fromList(utf8.encode(text)));
    return saved == null ? null : s.backupSaved;
  }

  Future<String?> _restore() async {
    final s = S.of(context);
    final file = await FilePicker.pickFile();
    if (file == null || !mounted) return null;
    final pass = await showDialog<String>(context: context, builder: (_) => PassphraseDialog(title: s.restoreBackup));
    if (pass == null) return null;
    final added = await ref.read(ledgerProvider.notifier).restore(_bookName.text.trim(), utf8.decode(await file.readAsBytes()), pass);
    return s.restored(added);
  }

  Future<String?> _start() async {
    await ref.read(ledgerProvider.notifier).start(
          _bookName.text.trim(),
          from: ref.read(bookProvider),
          store: ref.read(invoiceProvider).store,
          letterheads: ref.read(invoiceProvider).letterheads.values,
        );
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final state = ref.watch(ledgerProvider);
    final repo = state.repo;
    Widget pad(Widget w) => Padding(padding: const EdgeInsets.symmetric(vertical: 6), child: w);

    final syncBox = Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      pad(QrScanButton(
        onCode: (code) => _run(() => _sync(code)),
        child: Text(s.scanHub),
      )),
      Row(children: [
        Expanded(child: TextField(controller: _invitation, decoration: InputDecoration(labelText: s.pasteInvitation))),
        IconButton(
          icon: const Icon(Icons.sync),
          tooltip: s.syncNow,
          onPressed: () => _run(() => _sync(_invitation.text)),
        ),
      ]),
    ]);

    return ListView(padding: const EdgeInsets.all(16), children: [
      if (_busy) const LinearProgressIndicator(),
      if (!state.open) ...[
        Text(s.noHistory),
        pad(TextField(controller: _bookName, decoration: InputDecoration(labelText: s.bookName))),
        pad(FilledButton.icon(icon: const Icon(Icons.history), label: Text(s.startHistory), onPressed: _busy ? null : () => _run(_start))),
        const Divider(),
        Text(s.syncNow, style: Theme.of(context).textTheme.titleMedium),
        syncBox,
        pad(OutlinedButton.icon(icon: const Icon(Icons.restore), label: Text(s.restoreBackup), onPressed: _busy ? null : () => _run(_restore))),
        pad(OutlinedButton.icon(
          icon: const Icon(Icons.key),
          label: Text(s.keyEnter),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (_) => KeyPage(book: _bookName.text.trim(), save: false))),
        )),
      ] else ...[
        Text(state.book!, style: Theme.of(context).textTheme.headlineSmall),
        Text(s.deviceInfo(repo!.device, repo.series.isEmpty ? '—' : repo.series)),
        Text(s.changesInfo(repo.graph.length, state.ledger!.conflicts.length)),
        for (final p in state.problems) Text('! $p', style: TextStyle(color: Theme.of(context).colorScheme.error)),
        const Divider(),
        Text(s.syncNow, style: Theme.of(context).textTheme.titleMedium),
        syncBox,
        pad(const HubPanel()),
        const Divider(),
        pad(FilledButton.icon(icon: const Icon(Icons.save_alt), label: Text(s.backup), onPressed: _busy ? null : () => _run(_backup))),
        pad(OutlinedButton.icon(
          icon: const Icon(Icons.key),
          label: Text(s.keyToManager),
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (_) => KeyPage(book: state.book!, save: true))),
        )),
        if (state.ledger!.conflicts.isNotEmpty) ...[
          const Divider(),
          Text(s.conflictsTitle, style: Theme.of(context).textTheme.titleMedium),
          for (final c in state.ledger!.conflicts)
            ListTile(
              dense: true,
              title: Text(c.entity),
              subtitle: Text(s.replacedBy('${c.kept.device} ${FibuDate.show(c.kept.time)}',
                  '${c.replaced.device} ${FibuDate.show(c.replaced.time)}: ${c.replacedData}')),
            ),
        ],
        const Divider(),
        pad(TextButton(onPressed: () => _run(() async {
              await ref.read(ledgerProvider.notifier).close();
              return null;
            }), child: Text(s.closeHistory))),
      ],
    ]);
  }
}
