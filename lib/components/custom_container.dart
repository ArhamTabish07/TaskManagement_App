import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget? image;
  final Widget? text1;
  final Widget? text2;
  final double borderRadius;
  final Color? color;
  final Color? ContainerColor;

  const CustomContainer({
    super.key,
    required this.width,
    required this.height,
    this.image,
    required this.borderRadius,
    this.text1,
    this.text2,
    this.color,
    this.ContainerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: ContainerColor,
        gradient: ContainerColor == null
            ? LinearGradient(colors: [Color(0xff155DFC), Color(0xff9810FA)])
            : null,
        // boxShadow: [
        //   BoxShadow(
        //     color: Color(0xff000000).withValues(alpha: 0.1),
        //     spreadRadius: -5,
        //     blurRadius: 25,
        //     offset: Offset(0, 20), // changes position of shadow
        //   ),
        //   BoxShadow(
        //     // blurStyle: BlurStyle.outer,
        //     color: Color(0xff000000).withValues(alpha: 0.1),
        //     spreadRadius: -6,
        //     blurRadius: 10,
        //     offset: Offset(0, 8), // changes position of shadow
        //   ),
        // ],
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,s
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: image),
          Center(child: text1),
          Center(child: text2),
        ],
      ),
    );
  }
}
