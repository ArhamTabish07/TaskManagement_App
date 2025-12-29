import 'package:abc_app/core/components/text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final double? width;
  final double? textsize;
  final double? height;
  final double? borderwidth;
  final Color? bordercolor;
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
    this.borderwidth,
    this.bordercolor,
    this.textsize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? 56,
        width: width ?? 325,
        decoration: BoxDecoration(
          border: Border.all(
            color: bordercolor ?? Colors.transparent,
            width: borderwidth ?? 0,
          ),
          color: buttoncolor,
          gradient: buttoncolor == null
              ? LinearGradient(colors: [Color(0xff155DFC), Color(0xff9810FA)])
              : null,

          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Text(
            text,
            style: primaryTextStyle(
              weight: FontWeight.w500,
              size: textsize ?? 18,
              color: textcolor ?? Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
