import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

import '../generated/l10n.dart';
import '../rp_provider.dart';
import 'letterhead_editor.dart';

/// The letterheads — one per business you issue under: tap to change, +
/// to add.
class LetterheadsPage extends ConsumerWidget {
  const LetterheadsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = S.of(context);
    final letterheads = ref.watch(invoiceProvider).letterheads.values.toList();
    void open([Letterhead? l]) =>
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => LetterheadEditor(letterhead: l)));
    return Scaffold(
      appBar: AppBar(title: Text(s.letterheads)),
      floatingActionButton: FloatingActionButton(onPressed: open, child: const Icon(Icons.add)),
      body: ListView(children: [
        for (final l in letterheads)
          ListTile(
            leading: const Icon(Icons.badge_outlined),
            title: Text(l.name),
            subtitle: Text([l.id, l.tax.country, l.tax.regime == 'vat' ? s.vatRegime : s.franchise].join(' · ')),
            onTap: () => open(l),
          ),
      ]),
    );
  }
}
