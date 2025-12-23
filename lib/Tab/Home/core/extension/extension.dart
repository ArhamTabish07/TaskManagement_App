import 'package:flutter/material.dart';

extension IntToSizedBox on num {
  Widget get height => SizedBox(height: toDouble());
  Widget get width => SizedBox(width: toDouble());
}

// Code Formatter Extension
extension CountryCodeFormatter on String {
  String withPlus() => startsWith('+') ? this : '+$this';
}

// Screen Height and Screen Width Extension Method
extension SizeExtension on num {
  double get sh =>
      WidgetsBinding
          .instance
          .platformDispatcher
          .views
          .first
          .physicalSize
          .height /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio *
      this;
  double get sw =>
      WidgetsBinding
          .instance
          .platformDispatcher
          .views
          .first
          .physicalSize
          .width /
      WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio *
      this;
}
