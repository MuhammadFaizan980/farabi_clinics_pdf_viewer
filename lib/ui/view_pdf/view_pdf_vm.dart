import 'dart:typed_data';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/material.dart';

class ViewPdfVm extends ChangeNotifier {
  Future<void> downloadPdf({required Uint8List pdf}) async {
    await FileSaver.instance.saveFile(
      name: 'Farabi PDF',
      mimeType: MimeType.pdf,
      bytes: pdf,
    );
  }
}
