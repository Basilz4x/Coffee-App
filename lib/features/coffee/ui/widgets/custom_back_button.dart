import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          Feedback.forTap(context);
          context.pop();
        },
        child: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: AppColor.iconsColor,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Icon(
            Icons.arrow_back,
            size: 38,
            color: AppColor.secondaryColor,
          ),
        ),
      ),
    );
  }
}
