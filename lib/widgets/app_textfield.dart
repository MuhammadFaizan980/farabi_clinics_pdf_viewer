import 'package:farabi_clinics_pdf_viewer/utils/app_colors.dart';
import 'package:farabi_clinics_pdf_viewer/widgets/label_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final Color? borderColor;
  final Color? labelColor;
  bool obscureText;
  final bool isPassword;
  final bool enabled;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final Function(String)? onChange;
  final Function()? onTap;
  final String? error;
  final TextInputType textInputType;
  final bool mandatory;
  final int maxLines;

  AppTextField({
    required this.controller,
    required this.label,
    required this.hint,
    this.prefixWidget,
    this.labelColor,
    this.suffixWidget,
    this.isPassword = false,
    this.obscureText = false,
    this.enabled = true,
    this.onChange,
    this.onTap,
    this.error,
    this.borderColor,
    this.mandatory = false,
    this.textInputType = TextInputType.emailAddress,
    this.maxLines = 1,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return LabelWidget(
      label: widget.label,
      mandatory: widget.mandatory,
      color: widget.labelColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.prefixWidget != null) widget.prefixWidget!,
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 12),
              child: GestureDetector(
                onTap: widget.onTap,
                child: TextField(
                  controller: widget.controller,
                  obscureText: widget.obscureText,
                  cursorColor: Colors.black,
                  onChanged: widget.onChange,
                  maxLines: widget.maxLines,
                  enabled: widget.enabled,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                  keyboardType: widget.textInputType,
                  inputFormatters: [
                    if (widget.textInputType == TextInputType.phone ||
                        widget.textInputType == TextInputType.number)
                      FilteringTextInputFormatter.digitsOnly,
                  ],
                  decoration: InputDecoration(
                    errorText: widget.error,
                    hintText: widget.hint,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.black,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.black,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: widget.borderColor ?? Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (widget.suffixWidget != null) widget.suffixWidget!,
          if (widget.isPassword)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () => setState(() {
                  widget.obscureText = !widget.obscureText;
                }),
                child: Icon(
                  widget.obscureText ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.red,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
