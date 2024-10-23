import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:streetlamp/data/DummyData.dart';
import 'package:streetlamp/data/Event.dart';
import 'package:streetlamp/styles/CustomColors.dart';
import 'package:streetlamp/styles/CustomTextStyles.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Container(
                height: height * 0.45,
                width: width * 0.35,
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'graph'.tr(), textStyle: CustomTextStyle.semiBold(height: height, rate: 0.3, color: CustomColors.WHITE)),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: _tooltipBehavior,
                    series: <LineSeries<Event, String>>[
                      LineSeries<Event, String>(
                          dataSource: Dummydata().eventList,
                          xValueMapper: (Event list, _) => list.date,
                          yValueMapper: (Event list, _) =>
                              int.parse(list.usage),
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true))
                    ]));
  }
}
