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
    return Scaffold(
      appBar: commonAppbar(
          Text('82-62-CLT04-EIN01', style: CustomTextStyle.bold_32_black),
          // Appbar Title
          context,
          false, // Appbar 번역 버튼 gone
          true), // Appbar 닫기 버튼 gone
      body: Center(
        child: Row(
          children: [
            SizedBox(width: 16.w),
            ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset("images/streetlamp.png",
                    width: 160.w, height: kIsWeb ? 580.h : 700.h)),
            SizedBox(width: 16.w),
            Container(
              decoration: BoxDecoration(
                  color: CustomColors.PURPLE,
                  borderRadius: BorderRadius.circular(12.r)),
              child: eventHistory(),
            )
          ],
        ),
      ),
    );
  }

  Widget graphBox() {
    return Center();
  }

  Widget eventHistory() {
    final eventList = Dummydata().eventList;
    return Container(
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
            itemCount: eventList.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: [
                  Text(eventList[index].date,
                      style: CustomTextStyle.medium_12_black),
                  Text(eventList[index].charge,
                      style: CustomTextStyle.medium_12_black),
                  Text(eventList[index].usage,
                      style: CustomTextStyle.medium_12_black),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}
