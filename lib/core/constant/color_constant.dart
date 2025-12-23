import 'package:flutter/widgets.dart';

class ColorConstant {
  static const Color darkblue = Color(0xff1C398E);
  static const Color blue = Color(0xFF155DFC);
  static const Color containerblue = Color(0xFFEFF6FF);
  static const Color lightblue = Color(0xFFDBEAFE);
  static const Color purple = Color(0xFF9810FA);
  static const Color darkgrey = Color(0xff364153);
  static const Color grey = Color(0xff717182);
  static const Color lightgrey = Color(0xff99A1AF);
  static const Color black = Color(0xff0A0A0A);
  static const Color lightgreen = Color(0xffDCFCE7);
  static const Color darkgreen = Color(0xff008236);

  static const Gradient gradient = LinearGradient(
    colors: [Color(0xff155DFC), Color(0xff9810FA)],
  );
  static Color iconcontainerwhite = Color(0xffFFFFFF).withValues(alpha: 0.2);
  static Color infocontainerwhite = Color(0xffFFFFFF).withValues(alpha: 0.1);
  static Color textfieldfill = Color(0xffF3F3F5);
}
