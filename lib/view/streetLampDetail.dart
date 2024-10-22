import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/data/DummyData.dart';
import 'package:streetlamp/styles/CustomTextStyles.dart';

import '../styles/CustomColors.dart';
import 'commonAppbar.dart';

class StreetLampDetail extends StatefulWidget {
  const StreetLampDetail({super.key});

  @override
  State<StreetLampDetail> createState() => _StreetLampDetailState();
}

class _StreetLampDetailState extends State<StreetLampDetail> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: commonAppbar(
          Text('82-62-CLT01-EIN01', style: CustomTextStyle.bold_32_black),
          // Appbar Title
          context,
          true, // Appbar 번역 버튼 gone
          true), // Appbar 닫기 버튼 gone
      body: Padding(
        padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 20.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset("images/streetlamp.png",
                    height: double.infinity, fit: BoxFit.fitHeight)),
            SizedBox(width: 16.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              width: width/4.0,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: CustomColors.PURPLE,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                children: [
                  graphBox(),
                  eventHistory(),
                ],
              ),
            ),
            SizedBox(width: 16.h),
            Container(
              width: width/4.0,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  statusInfo(),
                  SizedBox(height: 12.h),
                  performanceInfo()
                ],
              ),
            ),
            SizedBox(width: 16.h),
            Container(width: width/4.0, height: double.infinity, child: realTime())
          ],
        ),
      ),
    );
  }

  Widget graphBox() {
    return Center();
  }

  Widget eventHistory() {
    final entries = Dummydata().eventList;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
          color: CustomColors.WHITE, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          Text(tr('eventHistory'), style: CustomTextStyle.semibold_20_black),
          SizedBox(height: 14.h),
          Row(
            children: [
              Text(tr('date'), style: CustomTextStyle.regular_10_black),
              Text(tr('charge_unit'), style: CustomTextStyle.regular_10_black),
              Text(tr('usage_unit'), style: CustomTextStyle.regular_10_black),
            ],
          ),
          SizedBox(height: 20.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Text(entries[index].date,
                      style: CustomTextStyle.medium_12_black),
                  Text(entries[index].charge,
                      style: CustomTextStyle.medium_12_black),
                  Text(entries[index].usage,
                      style: CustomTextStyle.medium_12_black),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget statusInfo() {
    final entries = Dummydata().statusList;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
            color: CustomColors.WHITE,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(children: [
          SizedBox(height: 12.h),
          Text(tr('status'), style: CustomTextStyle.semibold_20_black),
          SizedBox(height: 12.h),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            // 가능한 최소 공간만 차지하도록 설정
            physics: NeverScrollableScrollPhysics(),
            // 스크롤 비활성화
            mainAxisSpacing: 10.h,
            // 세로 방향 여백
            crossAxisSpacing: 8.w,
            // 가로 방향 여백
            childAspectRatio: 1.8,
            // 가로:세로 비율을 조정하여 높이를 줄임
            children: List.generate(6, (index) {
              return Container(
                width: 140.w,
                decoration: BoxDecoration(
                    color: CustomColors.LIGHT_PURPLE,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      entries[index].key,
                      style: CustomTextStyle.semibold_14_black,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      entries[index].value,
                      style: CustomTextStyle.bold_14_purple,
                    ),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 12.h)
        ]));
  }

  Widget performanceInfo() {
    final entries = Dummydata().performanceList;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
            color: CustomColors.WHITE,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(children: [
          SizedBox(height: 12.h),
          Text(tr('performance'), style: CustomTextStyle.semibold_20_black),
          SizedBox(height: 12.h),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            // 가능한 최소 공간만 차지하도록 설정
            physics: NeverScrollableScrollPhysics(),
            // 스크롤 비활성화
            mainAxisSpacing: 10.h,
            // 세로 방향 여백
            crossAxisSpacing: 8.w,
            // 가로 방향 여백
            childAspectRatio: 1.8,
            // 가로:세로 비율을 조정하여 높이를 줄임
            children: List.generate(6, (index) {
              return Container(
                width: 140.w,
                decoration: BoxDecoration(
                    color: CustomColors.LIGHT_PURPLE,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      entries[index].key,
                      style: CustomTextStyle.semibold_14_black,
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      entries[index].value,
                      style: CustomTextStyle.bold_14_purple,
                    ),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 12.h)
        ]));
  }

  Widget realTime() {
    final entries = Dummydata().realTimeList;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        decoration: BoxDecoration(
            color: CustomColors.WHITE,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(children: [
          SizedBox(height: 12.h),
          Text(tr('realtime'), style: CustomTextStyle.semibold_20_black),
          SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entries[index].key, style: CustomTextStyle.medium_14_black),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: CustomColors.LIGHT_PURPLE,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(entries[index].value, style: CustomTextStyle.bold_12_purple),
                  ),
                ],
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(
              color: CustomColors.GREY, // 구분선 색상
              thickness: 1.h, // 구분선 두께
              height: 12.h, // 항목 사이 간격
            ),
          )

        ]));
  }
}
