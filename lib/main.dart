import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:streetlamp/view/dashboard.dart';
import 'package:flutter/services.dart';

// 앱에서 지원하는 언어 리스트 변수
final supportedLocales = [const Locale('en', 'US'), const Locale('ko', 'KR')];

Future<void> main() async {
  // 앱 가로 고정
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]);

  // easylocalization 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // MyApp을 EasyLocalization 로 감싼다.
  runApp(EasyLocalization(
      // 지원 언어 리스트
      supportedLocales: supportedLocales,
      //path: 언어 파일 경로
      path: 'assets/translations',
      //fallbackLocale supportedLocales에 설정한 언어가 없는 경우 설정되는 언어
      fallbackLocale: Locale('en', 'US'),

      //startLocale을 지정하면 초기 언어가 설정한 언어로 변경됨
      //만일 이 설정을 하지 않으면 OS 언어를 따라 기본 언어가 설정됨
      startLocale: Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 화면 해상도: 1280*720 기준
      designSize: const Size(1280, 720),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(debugShowCheckedModeBanner: false, home: child);
      },
      child: Dashboard(),
    );
  }
}
