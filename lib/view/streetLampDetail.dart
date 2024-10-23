import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/data/DummyData.dart';
import 'package:streetlamp/styles/CustomTextStyles.dart';
import 'package:streetlamp/view/graph.dart';

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
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: commonAppbar(
          Text('82-62-CLT01-EIN01', style: CustomTextStyle.bold(height: height, rate: 0.45, color: CustomColors.BLACK)),
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
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
              width: width/4.0,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: CustomColors.PURPLE,
                  borderRadius: BorderRadius.circular(12.r)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                 Graph(),
                  SizedBox(height: 12.h),
                  eventHistory(height),
                ],
              ),
            ),
            SizedBox(width: 16.h),
            Container(
              width: width/4.4,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  statusInfo(height),
                  SizedBox(height: 12.h),
                  performanceInfo(height)
                ],
              ),
            ),
            SizedBox(width: 16.h),
            Container(width: width/4.0, height: double.infinity, child: realTime(height))
          ],
        ),
      ),
    );
  }

  Widget eventHistory(double height) {
    final entries = Dummydata().eventList;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      decoration: BoxDecoration(
          color: CustomColors.WHITE, borderRadius: BorderRadius.circular(12.r)),
      child: Column(
        children: [
          SizedBox(height: 8.h),
          Text(tr('eventHistory'), style: CustomTextStyle.semiBold(height: height, rate: 0.32, color: CustomColors.BLACK)),
          SizedBox(height: 14.h),
          Row(
            children: [
              Text(tr('date'), style: CustomTextStyle.regular(height: height, rate: 0.22, color: CustomColors.BLACK)),
              Text(tr('charge_unit'), style: CustomTextStyle.regular(height: height, rate: 0.22, color: CustomColors.BLACK)),
              Text(tr('usage_unit'), style: CustomTextStyle.regular(height: height, rate: 0.22, color: CustomColors.BLACK)),
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
                      style: CustomTextStyle.medium(height: height, rate: 0.25, color: CustomColors.BLACK)),
                  Text(entries[index].charge,
                      style: CustomTextStyle.medium(height: height, rate: 0.25, color: CustomColors.BLACK)),
                  Text(entries[index].usage,
                      style: CustomTextStyle.medium(height: height, rate: 0.25, color: CustomColors.BLACK)),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  Widget statusInfo(double height) {
    final entries = Dummydata().statusList;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
            color: CustomColors.WHITE,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(children: [
          SizedBox(height: 12.h),
          Text(tr('status'), style: CustomTextStyle.semiBold(height: height, rate: 0.32, color: CustomColors.BLACK)),
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
            childAspectRatio: 2.2,
            // 가로:세로 비율을 조정하여 높이를 줄임
            children: List.generate(6, (index) {
              return Container(
                decoration: BoxDecoration(
                    color: CustomColors.LIGHT_PURPLE,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      entries[index].key,
                      style: CustomTextStyle.medium(height: height, rate: 0.2, color: CustomColors.BLACK)),
                    Text(
                      entries[index].value,
                      style: CustomTextStyle.semiBold(height: height, rate: 0.23, color: CustomColors.PURPLE),
                    ),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 12.h)
        ]));
  }

  Widget performanceInfo(double height) {
    final entries = Dummydata().performanceList;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        decoration: BoxDecoration(
            color: CustomColors.WHITE,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(children: [
          SizedBox(height: 12.h),
          Text(tr('performance'), style: CustomTextStyle.semiBold(height: height, rate: 0.32, color: CustomColors.BLACK)),
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
            childAspectRatio: 2.2,
            // 가로:세로 비율을 조정하여 높이를 줄임
            children: List.generate(6, (index) {
              return Container(
                decoration: BoxDecoration(
                    color: CustomColors.LIGHT_PURPLE,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      entries[index].key,
                      style: CustomTextStyle.medium(height: height, rate: 0.2, color: CustomColors.BLACK)),
                    SizedBox(height: 4.h),
                    Text(
                      entries[index].value,
              style: CustomTextStyle.semiBold(height: height, rate: 0.23, color: CustomColors.PURPLE)),
                  ],
                ),
              );
            }),
          ),
          SizedBox(height: 12.h)
        ]));
  }

  Widget realTime(double height) {
    final entries = Dummydata().realTimeList;
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        decoration: BoxDecoration(
            color: CustomColors.WHITE,
            borderRadius: BorderRadius.circular(12.r)),
        child: Column(children: [
          SizedBox(height: 12.h),
          Text(tr('realtime'), style: CustomTextStyle.semiBold(height: height, rate: 0.32, color: CustomColors.BLACK)),
    SizedBox(height: 20.h),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: entries.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(entries[index].key, style: CustomTextStyle.medium(height: height, rate: 0.22, color: CustomColors.BLACK)),

              Container(
                    padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 6.h),
                    decoration: BoxDecoration(
                      color: CustomColors.LIGHT_PURPLE,
                      borderRadius: BorderRadius.circular(6.r),
                    ),
                    child: Text(entries[index].value, style: CustomTextStyle.bold(height: height, rate: 0.22, color: CustomColors.PURPLE)),
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
