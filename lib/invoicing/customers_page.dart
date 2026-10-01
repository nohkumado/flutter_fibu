import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../generated/l10n.dart';
import '../rp_provider.dart';
import 'customer_editor.dart';

/// The customer register: tap to change, + to add.
class CustomersPage extends ConsumerWidget {
  const CustomersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final s = S.of(context);
    final customers = ref.watch(invoiceProvider).store.customers.values.toList()
      ..sort((a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()));
    void open([dynamic c]) =>
        Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => CustomerEditor(customer: c)));
    return Scaffold(
      appBar: AppBar(title: Text(s.customers)),
      floatingActionButton: FloatingActionButton(onPressed: open, child: const Icon(Icons.person_add)),
      body: ListView(children: [
        for (final c in customers)
          ListTile(
            leading: Icon(c.business ? Icons.business : Icons.person),
            title: Text(c.name),
            subtitle: Text([c.country, c.lang, if (c.vatId.isNotEmpty) c.vatId].join(' · ')),
            onTap: () => open(c),
          ),
      ]),
    );
  }
}
