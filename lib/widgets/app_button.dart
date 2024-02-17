import 'package:farabi_clinics_pdf_viewer/utils/app_colors.dart';
import 'package:farabi_clinics_pdf_viewer/utils/scsreen_utils.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final Function()? onTap;
  final bool expanded;
  final bool isLoading;
  final double height;
  final double borderRadius;
  final Color bgColor;
  final Color textColor;
  final double fontSize;

  AppButton({
    required this.label,
    required this.onTap,
    this.isLoading = false,
    this.height = 45,
    this.borderRadius = 8,
    this.bgColor = AppColors.red,
    this.textColor = Colors.white,
    this.fontSize = 14,
  }) : expanded = false;

  AppButton.expanded({
    required this.label,
    required this.onTap,
    this.isLoading = false,
    this.height = 45,
    this.borderRadius = 8,
    this.bgColor = AppColors.red,
    this.textColor = Colors.white,
    this.fontSize = 14,
  }) : expanded = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: expanded ? getScreenWidth() : null,
      height: height,
      child: TextButton(
        onPressed: onTap,
        style: TextButton.styleFrom(
          backgroundColor: onTap != null ? bgColor : bgColor.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: isLoading
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 1,
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  label,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                  ),
                ),
              ),
      ),
    );
  }
}
