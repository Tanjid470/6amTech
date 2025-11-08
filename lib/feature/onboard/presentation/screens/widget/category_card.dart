
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:six_am_tech_task/config/font_constant.dart';
import 'package:six_am_tech_task/core/utils/const/text_style.dart';
import 'package:six_am_tech_task/shared/widgets/custom_shimmer.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const CategoryCard({
    super.key,
    required this.title,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.2,
      margin: const EdgeInsets.only(right: 5),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
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
              ],
            ),
          ),
          verticalGap(context, 1),
          Text(title,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: customTextStyle(context,
                  fontSize: TextSize.font16(context),
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
        ],
      ),
    );
  }

}
