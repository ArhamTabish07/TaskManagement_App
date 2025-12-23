import 'package:flutter/material.dart';

class WhiteContainer extends StatelessWidget {
  final Widget? child;
  const WhiteContainer({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 121,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            offset: Offset(0, 1),
            spreadRadius: 0,
            color: Colors.black.withValues(alpha: 0.1),
          ),
          BoxShadow(
            blurRadius: 2,
            offset: Offset(0, 1),
            spreadRadius: -1,
            color: Colors.black.withValues(alpha: 0.1),
          ),
        ],
      ),
      child: child,
    );
  }
}
