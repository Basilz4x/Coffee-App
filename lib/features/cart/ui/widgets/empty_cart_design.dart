import 'package:coffe_app/shared-widgets/app_bottom_navigator_bar.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/utils/constant/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class EmptyCartDesign extends ConsumerWidget {
  const EmptyCartDesign({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Column(
      children: [
        ColorFiltered(
            colorFilter:
                ColorFilter.mode(AppColor.iconsColor, BlendMode.modulate),
            child: Image.asset(
              "lib/assets/images/empty-cart.png",
            )),
        const SizedBox(
          height: 20,
        ),
        Text(
          "The cart is empty",
          style: Theme.of(context).textTheme.displaySmall!.copyWith(
              color: AppColor.iconsColor, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Go find the products you like",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColor.iconsColor),
        ),
        const SizedBox(
          height: 50,
        ),
        SizedBox(
          height: 60,
          width: 270,
          child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColor.iconsColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11))),
              onPressed: () {
                ref
                    .read(bottomNavigatorIndexProvider.notifier)
                    .update((state) => 0);
                context.goNamed(AppRouter.homePage.name);
              },
              child: Text(
                "Go Shopping",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColor.mainColor),
              )),
        )
      ],
    );
  }
}
