import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:condo_app/models/document.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';

import 'package:share/share.dart';

class PdfViewerScreen extends StatelessWidget {
  final Document document;

  const PdfViewerScreen({
    super.key,
    required this.document
  });

  Future<void> savePdfLocally() async {
    final bytes = const Base64Decoder().convert(document.fileData);
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/${document.name}.pdf').writeAsBytes(bytes);

    Share.shareFiles([file.path], mimeTypes: ['application/pdf']);
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(document.name),
        actions: [
          IconButton(
              onPressed: savePdfLocally,
              icon: const Icon(Icons.save_alt_rounded)
          )
        ],
      ),
      body: PDFView(
        filePath: null, // Pass null to load from data
        pdfData: Uint8List.fromList(const Base64Decoder().convert(document.fileData)),
      ),
    );
  }
}
