import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/styles/CustomColors.dart';
import 'package:streetlamp/view/streetLamps.dart';

import '../styles/CustomTextStyles.dart';
import 'commonAppbar.dart';

class Clusters extends StatefulWidget {
  const Clusters({super.key});

  @override
  State<Clusters> createState() => _ClustersState();
}

class _ClustersState extends State<Clusters>
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
    return Scaffold(
        appBar: commonAppbar(
            Text('82-62-ECO Intelli clusters', style: CustomTextStyle.bold_32_black),
            // Appbar Title
            context,
            false, // Appbar 번역 버튼 gone
            true), // Appbar 닫기 버튼 gone
        body: Stack(children: [
          Container(
              padding: kIsWeb ? EdgeInsets.fromLTRB(64.w, 38.h, 64.w, 52.h) : EdgeInsets.fromLTRB(32.w, 20.h, 32.w, 32.h),
              child: ClipRRect(
              borderRadius: BorderRadius.circular(12.r),
              child: Image.asset("images/clusters_map.png",
                  width: double.infinity, height: double.infinity, fit: BoxFit.fitWidth))),
          Positioned(
              top: 180.h,
              left: 140.w,
              child: animatedClusters("images/ic_clusters_1.png", 112)),
          Positioned(
              bottom: 110.h,
              left: 200.w,
              child: animatedClusters("images/ic_clusters_2.png", 100)),
          Positioned(
              bottom: 220.h,
              left: 550.w,
              child: animatedClusters("images/ic_clusters_3.png", 82)),
          Positioned(
              top: 100.h,
              left: 330.w,
              child: animatedClusters("images/ic_clusters_4.png", 82)),
          Positioned(
              bottom: 120.h,
              left: 760.w,
              child: animatedClusters("images/ic_clusters_5.png", 90)),
          Positioned(
              bottom: 170.h,
              right: 520.w,
              child: animatedClusters("images/ic_clusters_6.png", 100)),
          Positioned(
              top: 350.h,
              right: 640.w,
              child: animatedClusters("images/ic_clusters_7.png", 100))
        ]));
  }

  Widget animatedClusters(String imagePath, int size) {
    return GestureDetector(
      onTap: () {
        /** 클러스터 클릭하면, 4번째 페이지(가로등) 로 이동 **/
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => StreetLamps()));
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
                    color: CustomColors.RED.withOpacity(0.5 * _animation.value),
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
