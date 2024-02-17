import 'package:farabi_clinics_pdf_viewer/utils/app_colors.dart';
import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String label;
  final Widget child;
  final bool mandatory;
  final Color? color;
  final double fontSize;
  final FontWeight fontWeight;

  LabelWidget({
    required this.label,
    required this.child,
    this.mandatory = false,
    this.color,
    this.fontSize = 14,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: label,
                    style: TextStyle(
                      fontWeight: fontWeight,
                      fontSize: fontSize,
                      color: color ?? Colors.black.withOpacity(0.5),
                    ),
                  ),
                  if (mandatory)
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: AppColors.red,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        child,
      ],
    );
  }
}
