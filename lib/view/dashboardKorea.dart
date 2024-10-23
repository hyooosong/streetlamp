import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/data/DummyData.dart';
import 'package:streetlamp/styles/CustomColors.dart';
import 'package:streetlamp/view/clusters.dart';
import 'dart:io';

import '../data/City.dart';
import '../styles/CustomTextStyles.dart';
import 'commonAppbar.dart';

class DashboardKorea extends StatefulWidget {
  const DashboardKorea({super.key});

  @override
  State<DashboardKorea> createState() => _DashboardKoreaState();
}

class _DashboardKoreaState extends State<DashboardKorea> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: commonAppbar(
            Text.rich(TextSpan(children: [
              TextSpan(
                  text: 'ECO Sphere ', style: CustomTextStyle.bold(height: height, rate: 0.45, color: CustomColors.BLACK)),
              TextSpan(text: "VPP ", style: CustomTextStyle.bold(height: height, rate: 0.45, color: CustomColors.PURPLE)),
              TextSpan(text: 'Navigator', style: CustomTextStyle.bold(height: height, rate: 0.45, color: CustomColors.BLACK)),
            ])), // Appbar Title
            context,
            true, // Appbar 번역 버튼 gone
            true // Appbar 닫기 버튼 gone
            ),
        body: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              cityList(width, height, Dummydata().leftCityList, true),
              Container(
                padding: EdgeInsets.symmetric(vertical: height*0.07),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: Image.asset("images/korea_map.png",
                          height: double.infinity,
                          fit: BoxFit.fitHeight))),
              cityList(width, height, Dummydata().rightCityList, false)
            ],
          ),
        ));
  }
}

Widget cityList(double width, double height, List<City> entries, bool isVisibleText) {
  return SizedBox(
    width: width * 0.23,
    height: height * 0.9,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
            visible: isVisibleText,
            child:
                Text("install_count", style: CustomTextStyle.medium(height: height, rate: 0.25, color: CustomColors.PURPLE))
            .tr()),
        SizedBox(height: kIsWeb ? 8.h : 4.h),
        Center(
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  /** 박스(지역) 클릭하면, 3번째 페이지로 이동 **/
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Clusters()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.16,
                      height: height * 0.16,
                      decoration: BoxDecoration(
                          color: CustomColors.PURPLE,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: kIsWeb ? 12.h : 6.h),
                            Text(entries[index].cityName,
                                style: CustomTextStyle.medium(height: height, rate: 0.3, color: CustomColors.WHITE)),
                            SizedBox(height: kIsWeb ? 8.h : 4.h),
                            Container(
                              width: width * 0.13,
                              height: height * 0.08,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: CustomColors.LIGHT_PURPLE,
                                  borderRadius: BorderRadius.circular(8.r)),
                              child: Text(entries[index].count,
                                  style: CustomTextStyle.medium(height: height, rate: 0.3, color: CustomColors.BLACK)),
                            ),
                            SizedBox(height: kIsWeb ? 8.h : 4.h)
                          ]),
                    ),
                    SizedBox(height: kIsWeb ? 16.h : 8.h)
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}
