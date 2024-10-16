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
                TextSpan(text: "V", style: CustomTextStyle.bold_32_purple),
                TextSpan(text: 'irtual ', style: CustomTextStyle.bold_32_black),
                TextSpan(text: "P", style: CustomTextStyle.bold_32_purple),
                TextSpan(text: 'ower ', style: CustomTextStyle.bold_32_black),
                TextSpan(text: "P", style: CustomTextStyle.bold_32_purple),
                TextSpan(
                    text: 'lant dashboard',
                    style: CustomTextStyle.bold_32_black),
              ],
            ),
          ), // Appbar Title
          context,
          false, // Appbar 번역 버튼 gone
          false // Appbar 닫기 버튼 gone
      ),
      body: Container(
          padding: kIsWeb ? EdgeInsets.fromLTRB(32.w, 38.h, 32.w, 52.h) : EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 32.h),
          child: GestureDetector(
            child: Image.asset("images/dashboard_map.png",
                width: 1216.w, height: 540.h),
            onTap: () {
              /** 지도 클릭하면, 2번째 페이지로 이동 **/
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const DashboardKorea()));
            },
          )),
    );
  }
}
