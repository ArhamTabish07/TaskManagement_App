import 'package:flutter/material.dart';

class HeaderCard extends StatelessWidget {
  final double? height;
  final double? borderRadius;
  const HeaderCard({super.key, this.height, this.borderRadius});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 227,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(borderRadius ?? 40),
          bottomRight: Radius.circular(borderRadius ?? 40),
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/Container (2).png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
