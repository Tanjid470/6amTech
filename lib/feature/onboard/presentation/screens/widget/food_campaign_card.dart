import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:six_am_tech_task/config/font_constant.dart';
import 'package:six_am_tech_task/core/utils/const/app_colors.dart';
import 'package:six_am_tech_task/core/utils/const/text_style.dart';
import 'package:six_am_tech_task/shared/widgets/custom_shimmer.dart';

class FoodCampaignCard extends StatelessWidget {
  final String title;
  final int? itemNo;
  final String description;
  final String imageUrl;
  final dynamic originalPrice;
  final dynamic discount;
  final int? discountedPercentage;
  final bool? hasDiscount;

  const FoodCampaignCard({
    super.key,
    required this.title,
    this.itemNo,
    required this.description,
    required this.imageUrl,
    required this.originalPrice,
    required this.discount,
    this.discountedPercentage,
    this.hasDiscount = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.65,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: Colors.white,
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.grey.shade300,
          //     blurStyle: BlurStyle.outer,
          //     offset: Offset(0, 0),
          //     blurRadius: 10,
          //   ),
          // ],
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: const BorderRadius.all(Radius.circular(10))
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
              child: Stack(
                children: [
                  imageUrl.isNotEmpty
                      ? CachedNetworkImage (
                    imageUrl: imageUrl,
                    height: MediaQuery.of(context).size.width * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => Center(child: CustomShimmer(height: 100, width: MediaQuery.of(context).size.width * 0.5)),
                    errorWidget: (context, url, error) => Image.asset(
                      'assets/images/dummy.jpeg',
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.5,
                      fit: BoxFit.fill,
                    ),
                  )
                      : Image.asset ('assets/images/dummy.jpeg',
                    height:MediaQuery.of(context).size.width * 0.2,
                    width: MediaQuery.of(context).size.width * 0.2,
                    fit: BoxFit.fill,
                  ),
                    Positioned(
                        top: 5,
                        left: 5,
                        child: Container(
                            padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                gradient: LinearGradient(colors: [
                                  AppColors.baseColor,
                                  AppColors.baseColor,
                                ]),
                                border: Border.all(color: Colors.grey, width: 1)),
                            child: Text('${discount.toString()} %',
                                style: whiteText(
                                    fontWeight: FontWeight.w400,
                                    TextSize.font10(context))))),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
              child: Column(
                spacing: 1,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: customTextStyle(context,
                          fontSize: TextSize.font16(context),
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Text(
                    description,
                    style: customTextStyle(context,
                        fontSize: TextSize.font12(context),
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  randomStarRow(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        spacing: 3,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            '\$ $originalPrice',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: customTextStyle(context,
                                fontSize: TextSize.font12(context),
                                fontWeight: FontWeight.bold,
                                color: AppColors.black),
                          ),
                          horizontalGap(context, 1),
                          Text(
                            discount.toStringAsFixed(2),
                            style: TextStyle(
                              fontSize: TextSize.font12(context),
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                              decorationColor: Colors.grey,
                              decorationThickness: 2,
                            ),
                          ),
                        ],
                      ),
                      Icon(Icons.add,color: AppColors.black,size: TextSize.font28(context))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget randomStarRow() {
    final random = Random();
    int starCount = random.nextInt(5) + 1; // 1 to 5 stars

    return Row(
      children: List.generate(
        starCount,
            (index) => const Icon(Icons.star, color: Colors.green, size: 16),
      ),
    );
  }
}
