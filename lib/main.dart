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

  // easy-localization 초기화
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(EasyLocalization(
      // 지원 언어 리스트
      supportedLocales: supportedLocales,
      // path: 언어 파일 경로
      path: 'assets/translations',
      // fallbackLocale supportedLocales에 설정한 언어가 없는 경우 설정되는 언어
      fallbackLocale: const Locale('en', 'US'),
      // 초기 언어 지정, 해당 설정 없다면 OS 언어를 따라 기본 설정
      startLocale: const Locale('en', 'US'),
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return ScreenUtilInit(
      // 화면 해상도
      designSize: Size(width, height),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            debugShowCheckedModeBanner: false,
            home: child);
      },
      child: const Dashboard(),
    );
  }
}
