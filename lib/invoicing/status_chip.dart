import 'package:flutter/material.dart';
import 'package:nohfibu/nohfibu.dart';

import '../generated/l10n.dart';

/// A document's status as a small coloured label.
class StatusChip extends StatelessWidget {
  final InvoiceStatus status;

  const StatusChip(this.status, {super.key});

  static String label(S s, InvoiceStatus st) => switch (st) {
        InvoiceStatus.draft => s.status_draft,
        InvoiceStatus.open => s.status_open,
        InvoiceStatus.accepted => s.status_accepted,
        InvoiceStatus.refused => s.status_refused,
        InvoiceStatus.invoiced => s.status_invoiced,
        InvoiceStatus.unpaid => s.status_unpaid,
        InvoiceStatus.overdue => s.status_overdue,
        InvoiceStatus.paid => s.status_paid,
        InvoiceStatus.cancelled => s.status_cancelled,
      };

  static Color color(InvoiceStatus st) => switch (st) {
        InvoiceStatus.overdue => Colors.red,
        InvoiceStatus.open || InvoiceStatus.unpaid || InvoiceStatus.accepted => Colors.orange,
        InvoiceStatus.paid || InvoiceStatus.invoiced => Colors.green,
        InvoiceStatus.draft => Colors.blueGrey,
        _ => Colors.grey,
      };

  @override
  Widget build(BuildContext context) => Chip(
        label: Text(label(S.of(context), status)),
        labelStyle: TextStyle(color: color(status), fontSize: 12),
        side: BorderSide(color: color(status)),
        visualDensity: VisualDensity.compact,
      );
}
