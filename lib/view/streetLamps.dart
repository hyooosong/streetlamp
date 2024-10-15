import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/view/dashboard.dart';

import '../styles/CustomTextStyles.dart';
import 'commonAppbar.dart';

class StreetLamps extends StatefulWidget {
  const StreetLamps({super.key});

  @override
  State<StreetLamps> createState() => _StreetLampsState();
}

class _StreetLampsState extends State<StreetLamps> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppbar(
            Text('82-62-CLT02', style: CustomTextStyle.bold_32_black), // Appbar Title
            context,
            false, // Appbar 번역 버튼 gone
            true), // Appbar 닫기 버튼 gone
        body: Container(
            padding: EdgeInsets.fromLTRB(32.w, 38.h, 32.w, 52.h),
            child: GestureDetector(
              child: Image.asset("images/streetLamps_map.png",
                  width: 1216.w, height: 540.h),
              onTap: () {
                /** 지도 클릭하면, 5번째 페이지(상세화면)로 이동 **/
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Dashboard()));
              },
            ))
    );
  }
}