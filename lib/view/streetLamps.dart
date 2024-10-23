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

    _animation = Tween<double>(begin: 0.6, end: 1.0).animate(
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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: commonAppbar(
            Text('82-62-CLT01-ECO Intelli nodes', style: CustomTextStyle.bold(height: height, rate: 0.45, color: CustomColors.BLACK)),
            context,
            false, // Appbar 번역 버튼 gone
            true), // Appbar 닫기 버튼 gone
        body:  Stack(children: [
          Container(
              padding: kIsWeb ? EdgeInsets.fromLTRB(64.w, 38.h, 64.w, 52.h) : EdgeInsets.fromLTRB(32.w, 20.h, 32.w, 32.h),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.asset("images/streetLamps_map.png",
                      width: double.infinity, height: double.infinity, fit: BoxFit.fitWidth))),
          Positioned(
              top: height*0.05,
              left: width*0.3,
              child: animatedClusters("images/ic_streetlamp.png", height * 0.15)),
          Positioned(
              top: height*0.1,
              left: width*0.08,
              child: animatedClusters("images/ic_streetlamp.png", height * 0.11)),
          Positioned(
              top: height*0.2,
              left: width*0.55,
              child: animatedClusters("images/ic_streetlamp.png", height * 0.12)),
          Positioned(
              top: height*0.3,
              left: width*0.45,
              child: animatedClusters("images/ic_streetlamp.png", height * 0.18)),
          Positioned(
              top: height*0.45,
              left: width*0.12,
              child: animatedClusters("images/ic_streetlamp.png", height * 0.18)),
          Positioned(
              top: height*0.4,
              left: width*0.35,
              child: animatedClusters("images/ic_streetlamp.png", height * 0.12)),
          Positioned(
              top: height*0.4,
              left: width*0.57,
              child: animatedClusters("images/ic_streetlamp.png", height * 0.15))
        ]));
  }

  Widget animatedClusters(String imagePath, double size) {
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
                    color: CustomColors.YELLOW.withOpacity(0.5 * _animation.value),
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