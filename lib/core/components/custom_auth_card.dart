import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final double? height;
  CustomCard({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 227,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
        image: DecorationImage(
          image: AssetImage("assets/images/Container (2).png"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
