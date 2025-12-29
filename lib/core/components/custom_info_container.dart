import 'package:flutter/material.dart';
import 'package:task_management_app/core/constant/color_constant.dart';
import 'package:task_management_app/core/extension/size_extension.dart';

class CustomInfoContainer extends StatelessWidget {
  // final double width;
  // final double height;
  final Widget? title;
  final Widget? subtitle;
  final double borderRadius;
  final Color? color;
  final Color? ContainerColor;

  const CustomInfoContainer({
    super.key,
    // required this.width,
    // required this.height,
    required this.borderRadius,
    this.title,
    this.subtitle,
    this.color,
    this.ContainerColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.09.sh,
      width: 0.27.sw,
      decoration: BoxDecoration(
        color: ColorConstant.infocontainerwhite,

        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: title),
          Center(child: subtitle),
        ],
      ),
    );
  }
}
