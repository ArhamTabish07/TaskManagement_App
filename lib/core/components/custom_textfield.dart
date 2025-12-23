import 'package:abc_app/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final Widget? hint;
  final Icon? prefixIcon;
  final Widget? suffix;

  final bool? obscureText;
  final TextEditingController? controller;
  final FormFieldValidator? validator;

  const CustomTextfield({
    super.key,
    this.hint,
    this.prefixIcon,
    this.obscureText,
    this.controller,
    this.validator,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
        fillColor: ColorConstant.textfieldfill,
        prefixIcon: prefixIcon,
        hint: hint,
        suffix: suffix,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none, // 🔹 no visible border
        ),
      ),
      obscureText: obscureText ?? false,
    );
  }
}
