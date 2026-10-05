import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../generated/l10n.dart';
import '../rp_provider.dart';

/// This app as the hub (the desktop): serves the open book on the local
/// network and shows the code the other devices scan — while open.
class HubPanel extends ConsumerStatefulWidget {
  const HubPanel({super.key});

  @override
  ConsumerState<HubPanel> createState() => _HubPanelState();
}

class _HubPanelState extends ConsumerState<HubPanel> {
  SyncServer? _server;
  SyncInvitation? _invitation;

  Future<String> _lanAddress() async {
    for (final i in await NetworkInterface.list(type: InternetAddressType.IPv4)) {
      for (final a in i.addresses) {
        if (!a.isLoopback) return a.address;
      }
    }
    return InternetAddress.loopbackIPv4.address;
  }

  Future<void> _start() async {
    final state = ref.read(ledgerProvider);
    final repo = state.repo!;
    final host = await _lanAddress();
    final first = SyncInvitation(host: host, port: 0, book: repo.book, token: SyncInvitation.newToken(), key: repo.key);
    final server = SyncServer(repo.graph, first, onChanged: (_) => ref.read(ledgerProvider.notifier).refresh());
    await server.start();
    setState(() {
      _server = server;
      _invitation = SyncInvitation(host: host, port: server.port, book: repo.book, token: first.token, key: repo.key);
    });
  }

  Future<void> _stop() async {
    await _server?.stop();
    setState(() {
      _server = null;
      _invitation = null;
    });
  }

  @override
  void dispose() {
    _server?.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    if (_invitation == null) {
      return OutlinedButton.icon(icon: const Icon(Icons.wifi_tethering), label: Text(s.beHub), onPressed: _start);
    }
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(children: [
          Text(s.hubRunning, textAlign: TextAlign.center),
          const SizedBox(height: 8),
          Container(
            color: Colors.white,
            padding: const EdgeInsets.all(8),
            child: QrImageView(data: _invitation.toString(), size: 260),
          ),
          SelectableText('${_invitation!.host}:${_invitation!.port}', style: Theme.of(context).textTheme.bodySmall),
          TextButton(onPressed: _stop, child: Text(s.stopHub)),
        ]),
      ),
    );
  }
}
