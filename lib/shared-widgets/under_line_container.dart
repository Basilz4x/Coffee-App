import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:flutter/widgets.dart';

class UnderLineContainer extends StatelessWidget {
  const UnderLineContainer(
      {super.key, required this.height, required this.width});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      color: AppColor.iconsColor,
    );
  }
}
