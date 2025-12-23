import 'package:abc_app/core/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CustomiconContainer extends StatelessWidget {
  final double width;
  final double height;
  final Widget? icon;

  final double borderRadius;
  final Color? color;
  // final Color? ContainerColor;

  const CustomiconContainer({
    super.key,
    required this.width,
    required this.height,
    this.icon,
    required this.borderRadius,
    this.color,
    // this.ContainerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: ColorConstant.iconcontainerwhite,
        // gradient: ContainerColor == null
        //     ? LinearGradient(colors: [Color(0xff155DFC), Color(0xff9810FA)])
        //     : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Center(child: icon)],
      ),
    );
  }
}
