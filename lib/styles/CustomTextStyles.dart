import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CustomColors.dart';

class CustomTextStyle {
  static TextStyle bold({
    double height = 800.0,
    double rate = 0.5,
    Color color = CustomColors.BLACK,
  }) {
    return TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.bold,
      fontSize: height * rate * 0.1,
      color: color,
    );
  }

  static TextStyle semiBold({
    double height = 800.0,
    double rate = 0.5,
    Color color = CustomColors.BLACK,
  }) {
    return TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w600,
      fontSize: height * rate * 0.1,
      color: color,
    );
  }

  static TextStyle medium({
    double height = 800.0,
    double rate = 0.5,
    Color color = CustomColors.BLACK,
  }) {
    return TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w500,
      fontSize: height * rate * 0.1,
      color: color,
    );
  }

  static TextStyle regular({
    double height = 800.0,
    double rate = 0.5,
    Color color = CustomColors.BLACK,
  }) {
    return TextStyle(
      fontFamily: "Pretendard",
      fontWeight: FontWeight.w400,
      fontSize: height * rate * 0.1,
      color: color,
    );
  }
}