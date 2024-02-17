import 'dart:typed_data';

import 'package:farabi_clinics_pdf_viewer/ui/view_pdf/view_pdf_screen.dart';
import 'package:farabi_clinics_pdf_viewer/utils/scsreen_utils.dart';
import 'package:flutter/material.dart';

class PdfListDialog extends StatelessWidget {
  final List<Uint8List> pdfList;

  const PdfListDialog({super.key, required this.pdfList});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      surfaceTintColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(0),
      ),
      content: SizedBox(
        width: getScreenWidth() * 0.5,
        height: getScreenHeight() * 0.75,
        child: Stack(
          children: [
            Column(
              children: [
                const Text(
                  'Following PDFs were found',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                  ),
                ),
                Expanded(
                  child: GridView.count(
                    padding: const EdgeInsets.all(32),
                    crossAxisCount: 3,
                    children: [
                      ...pdfList
                          .map(
                            (e) => GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ViewPdfScreen(pdfBytes: e),
                                  ),
                                );
                              },
                              child: Container(
                                alignment: Alignment.center,
                                margin: const EdgeInsets.all(8),
                                color: Colors.black.withOpacity(0.1),
                                child: Icon(
                                  Icons.picture_as_pdf,
                                  color: Colors.black.withOpacity(0.3),
                                  size: 55,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
