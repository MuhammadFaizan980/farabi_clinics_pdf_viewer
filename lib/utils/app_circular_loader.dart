import 'package:farabi_clinics_pdf_viewer/utils/app_colors.dart';
import 'package:farabi_clinics_pdf_viewer/utils/scsreen_utils.dart';
import 'package:flutter/material.dart';

class AppCircularLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: getScreenWidth(),
      height: getScreenHeight(),
      alignment: Alignment.center,
      child: const CircularProgressIndicator(
        strokeWidth: 2,
        color: AppColors.red,
      ),
    );
  }
}
