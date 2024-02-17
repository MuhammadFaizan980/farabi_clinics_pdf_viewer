import 'dart:typed_data';

import 'package:farabi_clinics_pdf_viewer/ui/view_pdf/view_pdf_vm.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class ViewPdfScreen extends StatelessWidget {
  final Uint8List pdfBytes;

  const ViewPdfScreen({super.key, required this.pdfBytes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder<ViewPdfVm>.reactive(
        viewModelBuilder: () => ViewPdfVm(),
        builder: (context, vm, _) => Stack(
          children: [
            SfPdfViewer.memory(
              pdfBytes,
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  vm.downloadPdf(pdf: pdfBytes);
                },
                icon: const Icon(
                  Icons.download,
                  size: 55,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 55,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
