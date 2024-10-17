import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/data/CityListData.dart';
import 'package:streetlamp/styles/CustomColors.dart';
import 'package:streetlamp/view/clusters.dart';
import 'dart:io';

import '../data/City.dart';
import '../styles/CustomTextStyles.dart';
import 'commonAppbar.dart';

class DashboardKorea extends StatefulWidget {
  const  DashboardKorea({super.key});

  @override
  State<DashboardKorea> createState() => _DashboardKoreaState();
}

class _DashboardKoreaState extends State<DashboardKorea> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: commonAppbar(
              Text.rich(TextSpan(children: [
                TextSpan(text: "V", style: CustomTextStyle.bold_32_purple),
                TextSpan(text: 'irtual ', style: CustomTextStyle.bold_32_black),
                TextSpan(text: "P", style: CustomTextStyle.bold_32_purple),
                TextSpan(text: 'ower ', style: CustomTextStyle.bold_32_black),
                TextSpan(text: "P", style: CustomTextStyle.bold_32_purple),
                TextSpan(
                    text: 'lant dashboard', style: CustomTextStyle.bold_32_black),
              ])), // Appbar Title
              context,
              true, // Appbar 번역 버튼 gone
              true // Appbar 닫기 버튼 gone
              ),
          body: Center(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: cityList(CityListData().leftCityList, true)),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 38.h, 0.w, 32.h),
                  child: Image.asset("images/korea_map.png", width: 700.w, height: 540.h),
                ),
                cityList(CityListData().rightCityList, false)
              ],
            ),
          ));
  }
}

Widget cityList(List<City> entries, bool isVisibleText) {
  return SizedBox(
    width: 255.w,
    height: 600.h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Visibility(
            visible: isVisibleText,
            child: Text("install_count", style: CustomTextStyle.medium_14_purple).tr()),
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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Clusters()));
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: kIsWeb ? 190.w : 180.w,
                      height: kIsWeb ? 102.h : 90.w,
                      decoration: BoxDecoration(
                          color: CustomColors.PURPLE,
                          borderRadius: BorderRadius.circular(8.r)
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: kIsWeb ? 12.h : 6.h),
                            Text(entries[index].cityName,
                                style: kIsWeb ? CustomTextStyle.semibold_20_white : CustomTextStyle.semibold_16_white),
                            SizedBox(height: kIsWeb ? 8.h : 4.h),
                            Container(
                              width: kIsWeb ? 153.w : 143.w,
                              height: kIsWeb ? 44.h : 24.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: CustomColors.LIGHT_PURPLE,
                                borderRadius: BorderRadius.circular(8.r)
                              ),
                              child: Text(entries[index].count,
                                  style: kIsWeb ? CustomTextStyle.semibold_20_black: CustomTextStyle.semibold_16_black),
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
