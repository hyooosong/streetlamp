import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/view/dashboard.dart';
import 'package:streetlamp/view/streetLampDetail.dart';

import '../styles/CustomColors.dart';
import '../styles/CustomTextStyles.dart';
import 'commonAppbar.dart';

class StreetLamps extends StatefulWidget {
  const StreetLamps({super.key});

  @override
  State<StreetLamps> createState() => _StreetLampsState();
}

class _StreetLampsState extends State<StreetLamps>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true); // 반복 애니메이션 설정

    _animation = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: commonAppbar(
            Text('82-62-CLT04', style: CustomTextStyle.bold_32_black), // Appbar Title
            context,
            false, // Appbar 번역 버튼 gone
            true), // Appbar 닫기 버튼 gone
        body:  Stack(children: [
          Container(
            padding: kIsWeb ? EdgeInsets.fromLTRB(32.w, 38.h, 32.w, 52.h) : EdgeInsets.fromLTRB(16.w, 20.h, 16.w, 32.h),
            child: Image.asset("images/streetLamps_map.png",
                width: 1216.w, height: 540.h)),
          Positioned(
              top: 180.h,
              left: 140.w,
              child: animatedClusters("images/ic_streetlamp.png", 100)),
          Positioned(
              bottom: 100.h,
              left: 200.w,
              child: animatedClusters("images/ic_streetlamp.png", 100)),
          Positioned(
              bottom: 200.h,
              left: 530.w,
              child: animatedClusters("images/ic_streetlamp.png", 100)),
          Positioned(
              top: 100.h,
              right: 150.w,
              child: animatedClusters("images/ic_streetlamp.png", 100)),
          Positioned(
              top: 120.h,
              left: 570.w,
              child: animatedClusters("images/ic_streetlamp.png", 100)),
          Positioned(
              top: 170.h,
              right: 420.w,
              child: animatedClusters("images/ic_streetlamp.png", 100)),
          Positioned(
              top: 350.h,
              right: 140.w,
              child: animatedClusters("images/ic_streetlamp.png", 100))
        ]));
  }

  Widget animatedClusters(String imagePath, int size) {
    return GestureDetector(
      onTap: () {
        /** 가로등 클릭하면, 5번째 페이지(상세 화면) 로 이동 **/
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StreetLampDetail()));
      },
      child: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Container(
              width: size.w,
              height: size.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: CustomColors.YELLOW.withOpacity(0.6 * _animation.value),
                    // 투명도 조절
                    blurRadius: (size/10) * 3,
                    // 블러 반경
                    spreadRadius: 3.0, // 퍼지는 정도
                  ),
                ],
              ),
              child: Opacity(
                opacity: _animation.value, // 원의 투명도 조절
                child: Image.asset(imagePath, width: size.w, height: size.h),
              ),
            );
          },
        ),
      ),
    );
  }
}