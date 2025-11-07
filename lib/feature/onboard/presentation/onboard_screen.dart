import 'package:flutter/material.dart';
import 'package:six_am_tech_task/config/font_constant.dart';
import 'package:six_am_tech_task/core/utils/const/app_colors.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          appBar(),
         // body(),
        ],
      ),
    );
  }

  Widget body() {
    return SizedBox();
  }

  Widget appBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.baseColor,
            AppColors.baseColor,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            verticalGap(context, 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10,
              children: [
                Text("On Board")
              ],
            ),
            verticalGap(context, 1),
          ],
        ),
      ),
    );
  }
}
