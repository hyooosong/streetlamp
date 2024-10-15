import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/data/CityListData.dart';
import 'package:streetlamp/styles/CustomColors.dart';

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
                Center(child: cityList(CityListData().leftCityList)),
                Image.asset("images/korea_map.png", width: 700.w, height: 540.h),
                cityList(CityListData().rightCityList)
              ],
            ),
          ));
  }
}

Widget cityList(List<City> entries) {
  return SizedBox(
    width: 255.w,
    child: ListView.builder(
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 200.w,
              height: 100.h,
              decoration: BoxDecoration(
                  color: CustomColors.PURPLE,
                  borderRadius: BorderRadius.circular(8.r)
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 12.h),
                    Text(entries[index].cityName,
                        style: CustomTextStyle.semibold_20_white),
                    SizedBox(height: 8.h),
                    Container(
                      width: 153.w,
                      height: 44.h,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: CustomColors.LIGHT_PURPLE,
                        borderRadius: BorderRadius.circular(8.r)
                      ),
                      child: Text(entries[index].count,
                          style: CustomTextStyle.semibold_20_black),
                    ),
                    SizedBox(height: 8.h)
                  ]),
            ),
            SizedBox(height: 16.h)
          ],
        );
      },
    ),
  );
}
