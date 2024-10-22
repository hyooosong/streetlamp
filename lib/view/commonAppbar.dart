import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/CustomTextStyles.dart';

PreferredSizeWidget? commonAppbar(Widget title, BuildContext context,
    bool isLangVisible, bool isCloseVisible) {
  return AppBar(
    centerTitle: true,
    leadingWidth: 180.w,
    title: Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          title,
          SizedBox(width: 12.w),
          Visibility(
              visible: isLangVisible,
              maintainSize: true,
              maintainAnimation: true,
              maintainState: true,
              child:
                  GestureDetector(
                    // 언어 변경 로직
                      onTap: () {
                        if(context.locale.languageCode == "en") {
                          context.setLocale(const Locale('ko', 'KR'));
                        } else {
                          context.setLocale(const Locale('en', 'US'));
                        }
                      },
                      child: Image.asset("images/language.png", width: 100.w, height: 36.h)))
        ],
      ),
    ),
    leading: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w),
          child: Text("(주)에이드", style: CustomTextStyle.bold_20_purple, textAlign: TextAlign.center),
        )),
    actions: [
      GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Visibility(
            visible: isCloseVisible,
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(right: 32.w),
                child: SvgPicture.asset("images/ic_close.svg",
                    width: 40.w, height: 40.h, alignment: Alignment.center),
              ),
            )),
      )
    ],
  );
}
