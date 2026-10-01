import 'dart:io';

import 'package:path_provider/path_provider.dart';

/// Where the offers, invoices, customers and letterheads live: on Linux
/// and macOS ~/.config/nohfibu (shared with the facture command line), on
/// Android and elsewhere the app's support directory.
class InvoiceFiles {
  final Directory base;

  const InvoiceFiles(this.base);

  /// The letterheads (`<id>.yaml`).
  Directory get letterheads => Directory('${base.path}/letterheads');

  /// The archive of offers, invoices and customers.
  File get store => File('${base.path}/factures.json');

  static Future<InvoiceFiles> locate() async {
    final home = Platform.environment['HOME'];
    if ((Platform.isLinux || Platform.isMacOS) && home != null) {
      return InvoiceFiles(Directory('$home/.config/nohfibu'));
    }
    return InvoiceFiles(Directory('${(await getApplicationSupportDirectory()).path}/nohfibu'));
  }
}
