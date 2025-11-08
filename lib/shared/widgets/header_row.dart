import 'package:flutter/material.dart';
import 'package:six_am_tech_task/config/font_constant.dart';
import 'package:six_am_tech_task/core/utils/const/app_colors.dart';

class HeaderRow extends StatelessWidget {
  final String title;
  final String actionText;
  final VoidCallback onTap;

  const HeaderRow({
    super.key,
    required this.title,
    required this.actionText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold,fontSize: TextSize.font16(context))),
        InkWell(
          onTap: onTap,
          child: Text(
            actionText,
            style: TextStyle(
              color: AppColors.baseColor,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.baseColor,
              decorationThickness: 2,
            ),
          ),
        )
      ],
    );
  }
}
