import 'package:abc_app/components/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? height;
  // final double borderRadius;
  final Color? buttoncolor;
  final Color? textcolor;
  final VoidCallback? onTap;
  final String text;

  const CustomButton({
    super.key,
    this.width,
    this.height,
    // required this.borderRadius,
    this.buttoncolor,
    this.onTap,
    this.textcolor,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 56,
        width: width ?? 325,
        decoration: BoxDecoration(
          color: buttoncolor,
          gradient: buttoncolor == null
              ? LinearGradient(colors: [Color(0xff155DFC), Color(0xff9810FA)])
              : null,

          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 22,
              color: textcolor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
