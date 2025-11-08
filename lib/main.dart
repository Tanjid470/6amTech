import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:get/get.dart';
import 'package:six_am_tech_task/config/font_constant.dart';
import 'package:six_am_tech_task/route/app_pages.dart';
import 'package:six_am_tech_task/shared/widgets/bottom_navigation.dart';


final navigatorKey = GlobalKey<NavigatorState>();
int? isInitScreen;
bool? isWeb;

void main() {
  isWeb = false;
  isInitScreen = 1;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '6am Tech',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        textTheme: const TextTheme().apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      ),
      debugShowCheckedModeBanner: true,
      home: const BottomNavigationWidget(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: FlutterSmartDialog.init(
          toastBuilder: (String msg) => Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.red.shade300),
              child: Text(
                msg,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: TextSize.font16(context),
                ),
              ),
            ),
          ),
          loadingBuilder: (String msg) => CircularProgressIndicator()),
      navigatorObservers: [FlutterSmartDialog.observer],
      navigatorKey: navigatorKey,
    );
  }
}
