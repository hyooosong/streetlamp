import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../styles/CustomTextStyles.dart';

PreferredSizeWidget? commonAppbar(
    Widget title, BuildContext context, bool isLangVisible, bool isCloseVisible) {
  return AppBar(
    centerTitle: true,
    leadingWidth: 120,
    title: Row(
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
                Image.asset("images/language.png", width: 100.w, height: 36.h))
      ],
    ),
    leading: Padding(
      padding: EdgeInsets.fromLTRB(24.w, 7.h, 0.w, 0.h),
      child: Text("(주)에이드", style: CustomTextStyle.bold_20_purple),
    ),
    actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Visibility(
                visible: isCloseVisible,
                child: SvgPicture.asset("images/ic_close.svg",
                    width: 48.w, height: 48.h)),
          )
    ],
  );
}
