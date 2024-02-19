import 'package:coffe_app/features/coffee/ui/pages/coffee_bag_details_controller.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GrindOptionBox extends ConsumerWidget {
  const GrindOptionBox({super.key, required this.grindOption});
  final String grindOption;

  @override
  Widget build(BuildContext context, ref) {
    final grindOptionType = ref.watch(grindOptionTypeProvider);
    return GestureDetector(
      onTap: () {
        Utils.getGridOptionFunction(grindOption, ref);
      },
      child: SizedBox(
          width: 92,
          height: 92,
          child: Card(
            elevation: 0,
            color: AppColor.mainColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(
                  style: BorderStyle.solid,
                  width: 1.5,
                  color:
                      Utils.getGrindOptionColor(grindOption, grindOptionType),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(6),
                  child: Image.asset(
                    Utils.getGrindOptionImage(grindOption),
                    color:
                        Utils.getGrindOptionColor(grindOption, grindOptionType),
                    alignment: Alignment.center,
                    height: 40,
                  ),
                ),
                Text(
                  grindOption,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Utils.getGrindOptionColor(
                          grindOption, grindOptionType),
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )),
    );
  }
}
