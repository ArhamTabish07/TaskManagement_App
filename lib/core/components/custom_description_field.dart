import 'package:abc_app/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomDescriptionField extends StatelessWidget {
  final Widget? hint;
  final Widget? prefixIcon;
  final Widget? suffix;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;

  const CustomDescriptionField({
    super.key,
    this.hint,
    this.prefixIcon,
    this.suffix,
    this.controller,
    this.validator,
    this.minLines,
    this.maxLines,
    this.maxLength,
    this.textInputAction = TextInputAction.newline,
    this.textCapitalization = TextCapitalization.sentences,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      keyboardType: TextInputType.multiline,
      textInputAction: textInputAction,
      textCapitalization: textCapitalization,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorConstant.textfieldfill,
        hint: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffix,
        counterText: '', // remove default counter line (optional)
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
