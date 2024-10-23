import 'package:flutter/material.dart';
import 'package:streetlamp/data/DummyData.dart';
import 'package:streetlamp/data/Event.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Graph extends StatefulWidget {
  const Graph({super.key});

  @override
  State<Graph> createState() => _GraphState();
}

class _GraphState extends State<Graph> {
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState(){
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Container(
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: 'Half yearly sales analysis'),
                    // Enable legend
                    legend: Legend(isVisible: true),
                    // Enable tooltip
                    tooltipBehavior: _tooltipBehavior,

                    series: <LineSeries<Event, String>>[
                      LineSeries<Event, String>(
                          dataSource:  Dummydata().eventList,
                          xValueMapper: (Event list, _) => list.date,
                          yValueMapper: (Event list, _) => int.parse(list.usage),
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: true)
                      )
                    ]
                )
            )
        )
    );
  }
}
