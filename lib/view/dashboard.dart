import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/styles/CustomTextStyles.dart';

import 'commonAppbar.dart';
import 'dashboardKorea.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
          Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'ECO Sphere ', style: CustomTextStyle.bold_32_black),
                TextSpan(text: "VPP ", style: CustomTextStyle.bold_32_purple),
                TextSpan(text: 'Navigator', style: CustomTextStyle.bold_32_black),
              ],
            ),
          ), // Appbar Title
          context,
          false, // Appbar 번역 버튼 gone
          false // Appbar 닫기 버튼 gone
      ),
      body: Container(
          //padding: kIsWeb ? EdgeInsets.fromLTRB(32.w, 38.h, 32.w, 52.h) : EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 32.h),
        padding: EdgeInsets.zero,
          child: GestureDetector(
            child: Container(
                padding: kIsWeb ? EdgeInsets.fromLTRB(64.w, 38.h, 64.w, 52.h) : EdgeInsets.fromLTRB(32.w, 20.h, 32.w, 32.h),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Image.asset("images/dashboard_map.png",
                        width: double.infinity, height: double.infinity, fit: BoxFit.fitWidth))),
            onTap: () {
              /** 지도 클릭하면, 2번째 페이지로 이동 **/
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DashboardKorea()));
            },
          )),
    );
  }
}
