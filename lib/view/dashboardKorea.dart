import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/data/CityListData.dart';
import 'package:streetlamp/styles/CustomColors.dart';

import '../styles/CustomTextStyles.dart';
import 'CommonAppbar.dart';

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
        body: Row(
          children: [
            cityList(),
            Image.asset("images/korea_map.png", width: 700.w, height: 540.h),
            Column(
              children: [],
            ),
          ],
        ));
  }
}

Widget cityList() {
  final entries = CityListData().leftCityList;
  return ListView.builder(
    padding: const EdgeInsets.all(8),
    itemCount: entries.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        color: CustomColors.PURPLE,
        width: 180.w,
        height: 100.h,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 12.h),
              Text(entries[index].cityName, style: CustomTextStyle.semibold_20_white),
              SizedBox(height: 10.h),
              Container(
                height: 153.w,
                width: 44.h,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  color: CustomColors.LIGHT_PURPLE,
                ),
                child: Text(entries[index].count, style: CustomTextStyle.semibold_20_black),
              ),
              SizedBox(height: 10.h)
            ]),
      );
    },
  );
}
