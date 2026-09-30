import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nohfibu/nohfibu.dart';

import 'generated/l10n.dart';
import 'rp_provider.dart';

/// Books a stored operation of the open book: choose it, answer its
/// questions (date, accounts of a range, amounts, texts), check the preview
/// of the journal lines, book them.
class FastOpPage extends ConsumerStatefulWidget {
  const FastOpPage({super.key});

  @override
  ConsumerState<FastOpPage> createState() => _FastOpPageState();
}

class _FastOpPageState extends ConsumerState<FastOpPage> {
  String? _opName;
  Operation? _op;
  List<OpQuestion> _questions = [];
  final Map<String, TextEditingController> _fields = {};
  final Map<String, String> _accounts = {};

  void _choose(Book book, String? name) {
    for (final c in _fields.values) {
      c.dispose();
    }
    _fields.clear();
    _accounts.clear();
    final op = name == null ? null : book.ops[name];
    setState(() {
      _opName = name;
      _op = op is Operation ? op : null;
      _op?.prepare();
      _questions = _op?.questions() ?? [];
      for (final q in _questions) {
        if (q.kind == OpQuestionKind.account) {
          _accounts[q.key] = q.defaultValue;
        } else {
          _fields[q.key] = TextEditingController(text: q.defaultValue);
        }
      }
    });
  }

  Map<String, String> get _answers => {
        for (final e in _fields.entries) e.key: e.value.text,
        ..._accounts,
      };

  @override
  void dispose() {
    for (final c in _fields.values) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    final book = ref.watch(bookProvider);
    final names = book.ops.keys.toList()..sort();
    if (names.isEmpty) return Center(child: Text(s.noOps));

    List<JrlLine> lines = const [];
    String? problem;
    if (_op != null) {
      try {
        lines = _op!.fill(_answers);
      } on FormatException catch (e) {
        problem = e.message;
      }
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        DropdownButtonFormField<String>(
          initialValue: _opName,
          decoration: InputDecoration(labelText: s.chooseOp),
          items: [for (final n in names) DropdownMenuItem(value: n, child: Text(n))],
          onChanged: (n) => _choose(book, n),
        ),
        const SizedBox(height: 8),
        for (final q in _questions) _field(q),
        if (_op != null) ...[
          const SizedBox(height: 16),
          Text(s.preview, style: Theme.of(context).textTheme.titleMedium),
          if (problem != null)
            Text(problem, style: TextStyle(color: Theme.of(context).colorScheme.error))
          else
            for (final l in lines)
              Text("$l", style: const TextStyle(fontFamily: 'monospace')),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: FilledButton.icon(
              icon: const Icon(Icons.check),
              label: Text(s.bookIt),
              onPressed: problem != null || lines.isEmpty
                  ? null
                  : () {
                      ref.read(bookProvider.notifier).addLines(lines);
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(s.booked(lines.length))));
                      _choose(book, _opName);
                    },
            ),
          ),
        ],
      ],
    );
  }

  Widget _field(OpQuestion q) {
    if (q.kind == OpQuestionKind.account) {
      return DropdownButtonFormField<String>(
        initialValue: _accounts[q.key],
        decoration: InputDecoration(labelText: q.label),
        items: [
          for (final k in q.choices)
            DropdownMenuItem(value: k.name, child: Text("${k.name} ${k.desc.trim()}")),
        ],
        onChanged: (v) => setState(() => _accounts[q.key] = v ?? q.defaultValue),
      );
    }
    return TextField(
      controller: _fields[q.key],
      decoration: InputDecoration(labelText: q.label),
      keyboardType: q.kind == OpQuestionKind.amount
          ? const TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      onChanged: (_) => setState(() {}),
    );
  }
}
