import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:six_am_tech_task/config/font_constant.dart';
import 'package:six_am_tech_task/core/utils/const/app_colors.dart';
import 'package:six_am_tech_task/feature/onboard/presentation/controller/onboard_controller.dart';
import 'package:six_am_tech_task/feature/onboard/presentation/screens/widget/popular_food_card.dart';
import 'package:six_am_tech_task/shared/widgets/custom_searcher.dart';
import 'package:six_am_tech_task/shared/widgets/header_row.dart';
import 'package:skeletonizer/skeletonizer.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({super.key});

  @override
  State<OnBoardScreen> createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  OnBoardController controller = Get.put(OnBoardController());

  @override
  void initState() {
    controller.initAll();
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
            CustomSearcher(
              controller: controller.searchController,
              onChanged: (value) => print(value),
            ),
            verticalGap(context, 1),
            bannerSlider(),
            Expanded(child: body()),
          ],
        ),
      ),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          popularFoodNearby()
        ],
      ),
    );
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

  Widget bannerSlider() {
    return Obx(() {
      return controller.isLoadingBanners.value == true
          ? Skeletonizer(
            enabled: true,
            child: Column(
              children: [
                Container(
                  height: Get.height / 7,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return Container(
                      width: 6,
                      height: 6,
                      margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(7),
                      ),
                    );
                  }),
                ),
              ],
            ),
          )
          : Column(
            children: [
              SizedBox(
                height: Get.height / 7,
                child: CarouselSlider.builder(
                  itemCount: controller.allBanners?.length ?? 0,
                  itemBuilder: (BuildContext context, int index, int realIndex) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: const BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: NetworkImage(controller.allBanners?[index].imageFullUrl ?? ""),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                  options: CarouselOptions(
                    height: MediaQuery.of(context).size.height,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    enlargeCenterPage: true,
                    viewportFraction: 1.0,
                    onPageChanged: (index, reason) {
                      controller.changePage(index);
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(controller.allBanners?.length ?? 0, (index) {
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

  Widget popularFoodNearby(){
    return Column(
      children: [
        HeaderRow(
          title: 'Popular Food Nearby',
          actionText: 'View all',
          onTap: () {
            // handle tap
          },
        ),
        verticalGap(context, 1),
        Obx(() {
          return controller.isLoadingPopularFood.value == true
              ? Skeletonizer(
            enabled: true,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(4, (index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: SizedBox(
                      width: Get.width * 0.5,
                      child: const PopularFoodCard(
                        title: "title",
                        description: "description",
                        imageUrl: "",
                        originalPrice: 0,
                        rating: 0,
                      ),
                    ),
                  );
                }),
              ),
            ),
          )
              : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: controller.allPopularFood
                  ?.asMap()
                  .entries
                  .map((entry) {
                var food = entry.value;
                final isSingle = controller.allPopularFood?.length == 1;

                return Padding(
                  padding: EdgeInsets.only(right: isSingle ? 0 : 8),
                  child: SizedBox(
                    width: isSingle
                        ? Get.width * 0.5
                        : Get.width * 0.5,
                    child: PopularFoodCard(
                      title: food.name ?? "",
                      description: food.restaurantName ?? "",
                      imageUrl: food.imageFullUrl ?? "",
                      originalPrice: food.price ?? 0,
                      rating: food.avgRating ?? 0,
                    ),
                  ),
                );
              }).toList() ??
                  [],
            ),
          );
        }),
      ],
    );
  }

}
