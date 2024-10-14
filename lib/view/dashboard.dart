import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/styles/CustomTextStyles.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Virtual Power Plant dashboard", style: CustomTextStyle.bold_32_black),
        actions: [
          Text("(주)에이드", style: CustomTextStyle.bold_20_purple)
        ],
      ),
      body: Center(),
    );
  }
}
