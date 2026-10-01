import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';

/// A PDF on screen, with printing's share and print buttons.
class PdfPage extends StatelessWidget {
  final String title;
  final Future<Uint8List> Function() makePdf;

  const PdfPage({super.key, required this.title, required this.makePdf});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(title)),
        body: PdfPreview(
          build: (PdfPageFormat _) => makePdf(),
          pdfFileName: '$title.pdf',
          canChangePageFormat: false,
          canChangeOrientation: false,
        ),
      );
}
