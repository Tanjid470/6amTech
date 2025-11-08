import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:six_am_tech_task/config/font_constant.dart';
import 'package:six_am_tech_task/core/utils/const/app_colors.dart';
import 'package:six_am_tech_task/core/utils/const/text_style.dart';
import 'package:six_am_tech_task/shared/widgets/custom_shimmer.dart';

class PopularFoodCard extends StatelessWidget {
  final String title;
  final int? itemNo;
  final String description;
  final String imageUrl;
  final int originalPrice;
  final dynamic rating;
  final int? discountedPercentage;
  final bool? hasDiscount;

  const PopularFoodCard({
    super.key,
    required this.title,
    this.itemNo,
    required this.description,
    required this.imageUrl,
    required this.originalPrice,
    required this.rating,
    this.discountedPercentage,
    this.hasDiscount = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
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
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Stack(
              children: [
                imageUrl.isNotEmpty
                    ? CachedNetworkImage (
                      imageUrl: imageUrl,
                      height: 100,
                      width: MediaQuery.of(context).size.width * 0.5,
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
                  height: 120,
                  width: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.fill,
                ),
                if(hasDiscount == true)
                  Positioned(
                      bottom: 5,
                      left: 5,
                      child: Container(
                          padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              gradient: LinearGradient(colors: [
                                AppColors.baseColor.withOpacity(0.5),
                                AppColors.baseColor.withOpacity(0.2),
                              ]),
                              border: Border.all(color: Colors.grey, width: 1)),
                          child: Text('Scholarship available',
                              style: whiteText(
                                  fontWeight: FontWeight.w400,
                                  TextSize.font10(context))))),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              spacing: 1,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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
                Row(
                  spacing: 3,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '\$ $originalPrice',
                      style: customTextStyle(context,
                          fontSize: TextSize.font12(context),
                          fontWeight: FontWeight.bold,
                          color: AppColors.black),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star,color: AppColors.baseColor,size: TextSize.font12(context)),
                        Text(
                          rating.toStringAsFixed(2),
                          style: customTextStyle(
                            context,
                            fontSize: TextSize.font12(context),
                            fontWeight: FontWeight.bold,
                            color: AppColors.baseColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
