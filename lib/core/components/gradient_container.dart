import 'package:flutter/material.dart';

class GradientContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final double? width;
  final double? borderRadius;
  const GradientContainer({
    super.key,
    this.child,
    this.height,
    this.width,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius ?? 200),
        gradient: const LinearGradient(
          colors: [Color(0xff155DFC), Color(0xff9810FA)],
        ),
      ),
      child: child,
    );
  }
}
