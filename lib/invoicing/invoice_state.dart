import 'package:nohfibu/nohfibu.dart';

import 'invoice_files.dart';

/// The app's offers and invoices: the archive, the letterheads, where they
/// live — and the desk that runs the workflow on them. A new object after
/// every change, so the screens follow.
class InvoiceState {
  final InvoiceFiles? files;
  final InvoiceStore store;
  final Map<String, Letterhead> letterheads;

  const InvoiceState({this.files, required this.store, this.letterheads = const {}});

  bool get ready => files != null;

  /// The workflow on this state (numbers kept next to the archive).
  InvoiceDesk get desk => InvoiceDesk.forFile(store, files!.store, letterheads);

  InvoiceState copy() => InvoiceState(files: files, store: store, letterheads: Map.of(letterheads));
}
