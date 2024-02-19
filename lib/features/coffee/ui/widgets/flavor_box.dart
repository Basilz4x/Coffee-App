import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/utils/utils.dart';
import 'package:flutter/material.dart';

class FlavorBox extends StatelessWidget {
  const FlavorBox({super.key, required this.flavor});
  final String flavor;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Utils.getFlavorOptionRandomColor(flavor).withOpacity(0.5),
          borderRadius: BorderRadius.circular(18),
        ),
        height: 27,
        child: Text(
          flavor,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColor.textColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
