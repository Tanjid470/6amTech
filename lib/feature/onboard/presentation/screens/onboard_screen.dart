import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_am_tech_task/config/font_constant.dart';
import 'package:six_am_tech_task/core/utils/const/app_colors.dart';
import 'package:six_am_tech_task/feature/onboard/presentation/controller/onboard_controller.dart';
import 'package:six_am_tech_task/shared/widgets/custom_searcher.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  OnBoardController controller = Get.put(OnBoardController());

  @override
  void initState() {
    controller.getAllBanners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            verticalGap(context, 5),
            appBar(),
            verticalGap(context, 2),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomSearcher(
                    controller: controller.searchController,
                    onChanged: (value) => print(value),
                  ),
                  verticalGap(context, 1),
                  bannerSlider()
                ],
              ),
            ),
            Expanded(child: body()),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return SizedBox(
      child: Text(controller.allBanners!.length.toString()),
    );
  }

  Widget bannerSlider(){
    return Obx(() {
        return Column(
          children: [
            SizedBox(
              height: Get.height / 7,
              child: CarouselSlider.builder(
                itemCount: controller.allBanners?.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Container(
                    decoration: BoxDecoration(
                        color : Colors.transparent,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                            image:NetworkImage(controller.allBanners?[index].imageFullUrl ?? ""),
                            fit: BoxFit.cover
                        )
                    ),
                  );
                },
                options: CarouselOptions(
                  height: MediaQuery.of(context).size.height, // Adjust height accordingly
                  autoPlay: true,  // Enable auto-play
                  autoPlayInterval: const Duration(seconds: 3),  // Time between transitions
                  enlargeCenterPage: true, // Enlarge the current item
                  viewportFraction: 1.0, // Display one item at a time
                  onPageChanged: (index, reason) {
                    controller.changePage(index);
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(controller.allBanners!.length, (index) {
                return InkWell(
                  onTap: () => controller.changePage(index),
                  child: Container(
                    width: controller.selectedPage.value == index ? 7.0 : 5.0,
                    height: controller.selectedPage.value == index ? 7.0 : 5.0,
                    margin: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(7)),
                      color: controller.selectedPage.value == index
                          ? AppColors.baseColor
                          : Colors.grey.shade300,
                    ),
                  ),
                );
              }),
            ),
          ],
        );
    });
  }

  Widget appBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      spacing: 10,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.home_filled,color: AppColors.greyColor,size: TextSize.font20(context)),
            horizontalGap(context, 1),
            Text("76A eighth evenue, New York, US",
              style: TextStyle(
                color: AppColors.greyColor,
                fontSize: TextSize.font14(context)
              ),
            ),
          ],
        ),
        Icon(Icons.notifications_active_rounded,size: TextSize.font20(context))
      ],
    );
  }
}
