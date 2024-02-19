import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:flutter/material.dart';

class ItemRating extends StatelessWidget {
  const ItemRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.star,
          color: AppColor.starColor,
          size: 16,
        ),
        Icon(
          Icons.star,
          color: AppColor.starColor,
          size: 16,
        ),
        Icon(
          Icons.star,
          color: AppColor.starColor,
          size: 16,
        ),
        Icon(
          Icons.star,
          color: AppColor.starColor,
          size: 16,
        ),
        Icon(
          Icons.star_border,
          color: AppColor.starColor,
          size: 16,
        ),
      ],
    );
  }
}
