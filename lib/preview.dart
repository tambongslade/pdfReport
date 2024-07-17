import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class PreviewDocument extends StatelessWidget {
  final Uint8List pdfData;

  const PreviewDocument({Key? key, required this.pdfData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Preview Document'),
      ),
      body: PdfPreview(
        build: (format) => pdfData,
      ),
    );
  }
}
