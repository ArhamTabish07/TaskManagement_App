import 'package:abc_app/constant/colors.dart';
import 'package:flutter/material.dart';

TextStyle primaryTextStyle({
  FontWeight? weight,
  double? size,
  Color? color,
  double? height,
  List<FontFeature>? features,
  TextDecoration? decoration,
  Color? decorationColor,
}) {
  return TextStyle(
    // height: height ?? 1.5,
    fontFamily: 'Inter',
    fontWeight: weight,
    color: color ?? ColorConstant.black,
    fontSize: size,
    // fontFeatures: features,
    // decoration: decoration,
    // decorationColor: decorationColor,
  );
}

TextStyle arimoTextStyle({
  FontWeight? weight,
  double? size,
  Color? color,
  double? height,
  List<FontFeature>? features,
  TextDecoration? decoration,
  Color? decorationColor,
}) {
  return TextStyle(
    // height: height ?? 1.5,
    fontFamily: 'Arimo',
    fontWeight: weight,
    color: color ?? ColorConstant.black,
    fontSize: size,
    // fontFeatures: features,
    // decoration: decoration,
    // decorationColor: decorationColor,
  );
}
