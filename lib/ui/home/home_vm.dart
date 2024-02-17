import 'dart:convert';
import 'dart:typed_data';

import 'package:farabi_clinics_pdf_viewer/main.dart';
import 'package:farabi_clinics_pdf_viewer/ui/view_pdf/view_pdf_screen.dart';
import 'package:flutter/material.dart';

class HomeVm extends ChangeNotifier {
  final TextEditingController jsonController = TextEditingController();

  Future<void> parseJson() async {
    String rawJsonString = jsonController.text.trim();
    try {
      var json = jsonDecode(rawJsonString);
      for (var i in json['entry']) {
        if (i['resource']['supportingInfo'] != null) {
          for (var j in i['resource']['supportingInfo']) {
            if (j['valueAttachment'] != null) {
              String content = j['valueAttachment']['data'];
              Uint8List pdfFileBytes = base64Decode(content);
              Navigator.of(navigatorKey.currentState!.context).push(
                MaterialPageRoute(
                  builder: (context) => ViewPdfScreen(pdfBytes: pdfFileBytes),
                ),
              );
            }
          }
        }
      }
    } catch (e) {
      print('Invalid JSON');
    }
  }

  /// getters/setters below this line...

  @override
  void dispose() {
    jsonController.dispose();
    super.dispose();
  }
}
