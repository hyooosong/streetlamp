import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'CustomColors.dart';

class CustomTextStyle {
  static var bold_32_black = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.bold, fontSize: 32.w, color: CustomColors.BLACK);
  static var semibold_20_black = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w600, fontSize: 20.w, color: CustomColors.BLACK);
  static var semibold_16_black = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w600, fontSize: 16.w, color: CustomColors.BLACK);
  static var regular_10_black = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w400, fontSize: 10.w, color: CustomColors.BLACK);
  static var medium_12_black = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w500, fontSize: 12.w, color: CustomColors.BLACK);

  static var semibold_20_white = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w600, fontSize: 20.w, color: CustomColors.WHITE);
  static var semibold_16_white = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w600, fontSize: 16.w, color: CustomColors.WHITE);

  static var medium_14_purple = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.w500, fontSize: 14.w, color: CustomColors.PURPLE);
  static var bold_32_purple = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.bold, fontSize: 32.w, color: CustomColors.PURPLE);
  static var bold_20_purple = TextStyle(fontFamily: "Pretendard", fontWeight: FontWeight.bold, fontSize: 20.w, color: CustomColors.PURPLE);
}