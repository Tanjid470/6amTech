import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:six_am_tech_task/main.dart';
import 'package:six_am_tech_task/shared/widgets/bottom_navigation.dart';
part 'app_routes.dart';

class AppPages{
  AppPages._();

  static String INITIAL = isWeb == true
      ? RouteNames.webApp
      : isInitScreen == 0 || isInitScreen == null
      ? RouteNames.onboardView
      : RouteNames.bottomNavigationWidget;

  static final routes =[
    GetPage(
      name:_Paths.bottomNavigationWidget,
      page: () => const BottomNavigationWidget(),
      transition: Transition.leftToRight,
      curve: Curves.fastOutSlowIn,
    ),


  ];
}