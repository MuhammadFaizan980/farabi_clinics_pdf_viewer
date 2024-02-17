import 'dart:convert';
import 'dart:typed_data';

import 'package:farabi_clinics_pdf_viewer/dialogues/pdf_list_dialog.dart';
import 'package:farabi_clinics_pdf_viewer/main.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class HomeVm extends ChangeNotifier {
  String? _jsonParsingError;
  final List<Uint8List> _pdfsFound = [];
  Map<String, dynamic>? _jsonFile;
  String? _fileName;

  Future<void> pickJsonFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowedExtensions: ['json'],
    );
    if (result?.files.isNotEmpty == true) {
      PlatformFile fileRead = result!.files.first;
      String jsonString = utf8.decode(fileRead.bytes!.toList());
      _jsonFile = jsonDecode(jsonString);
      fileName = fileRead.name;
    }
  }

  Future<void> parseJson() async {
    jsonParsingError = null;
    try {
      _pdfsFound.clear();
      for (var i in _jsonFile!['entry']) {
        if (i['resource']['supportingInfo'] != null) {
          for (var j in i['resource']['supportingInfo']) {
            if (j['valueAttachment'] != null) {
              String content = j['valueAttachment']['data'];
              _pdfsFound.add(base64Decode(content));
              // Uint8List pdfFileBytes = base64Decode(content);
              // Navigator.of(navigatorKey.currentState!.context).push(
              //   MaterialPageRoute(
              //     builder: (context) => ViewPdfScreen(pdfBytes: pdfFileBytes),
              //   ),
              // );
            }
          }
        }
      }
      if (_pdfsFound.isNotEmpty) {
        showDialog(
          context: navigatorKey.currentState!.context,
          builder: (context) => PdfListDialog(pdfList: _pdfsFound),
        );
      }
    } catch (e) {
      print('Invalid JSON');
      jsonParsingError =
          'Invalid JSON entered or JSON does not contain PDF files';
    }
  }

  /// getters/setters below this line...

  String? get jsonParsingError => _jsonParsingError;

  set jsonParsingError(String? value) {
    _jsonParsingError = value;
    notifyListeners();
  }

  String? get fileName => _fileName;

  set fileName(String? value) {
    _fileName = value;
    notifyListeners();
  }
}
