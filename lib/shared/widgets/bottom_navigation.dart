import 'package:flutter/material.dart';
import 'package:six_am_tech_task/config/font_constant.dart';
import 'package:six_am_tech_task/core/utils/const/app_colors.dart';
import 'package:six_am_tech_task/feature/onboard/presentation/screens/onboard_screen.dart';


class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  BottomNavigationWidgetState  createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int selectedIndex = 0;
  PageController pageController = PageController();
  void onTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    pageController.jumpToPage(index);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children:  [
          const OnBoardScreen(),
          Center(child: Text('Favorite',style: TextStyle(fontSize: TextSize.font26(context),fontWeight: FontWeight.bold))),
          Center(child: Text('List',style: TextStyle(fontSize: TextSize.font26(context),fontWeight: FontWeight.bold))),
          Center(child: Text('Menu',style: TextStyle(fontSize: TextSize.font26(context),fontWeight: FontWeight.bold))),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              decoration:  BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    spreadRadius: 20,
                    blurRadius: 30,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
            ),
          ),
          BottomNavigationBar(
            items:  <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_filled,size: TextSize.font26(context)),
                  label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border,size: TextSize.font26(context)),label: 'Favorite'),
              BottomNavigationBarItem(icon: Icon(Icons.note_alt_outlined,size: TextSize.font26(context)),label: 'List'),
              BottomNavigationBarItem(icon: Icon(Icons.menu,size: TextSize.font26(context)),label: 'Menu'),
            ],
            currentIndex: selectedIndex,
            unselectedLabelStyle: TextStyle(fontSize: TextSize.font14(context),fontWeight: FontWeight.w400),
            selectedLabelStyle: TextStyle(fontSize: TextSize.font14(context),fontWeight: FontWeight.bold),
            landscapeLayout: BottomNavigationBarLandscapeLayout.linear,
            unselectedItemColor: Colors.grey,
            selectedIconTheme:  IconThemeData(color: AppColors.baseColor),
            iconSize: TextSize.font36(context),
            selectedFontSize: TextSize.font14(context),
            selectedItemColor: AppColors.baseColor,
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: true,
            showUnselectedLabels: true,
            onTap: onTapped,
          ),
        ],
      ),
    );
  }
}