import 'package:coffe_app/features/coffee/ui/pages/home_page_controller.dart';
import 'package:coffe_app/utils/constant/app_constant.dart';
import 'package:coffe_app/utils/utils.dart';
import 'package:coffe_app/shared-widgets/under_line_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CoffeeTypeFilter extends ConsumerWidget {
  const CoffeeTypeFilter({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final coffeeFilter = ref.watch(coffeeTypeFilterProvider);

    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      TextButton(
        onPressed: () {
          ref
              .read(coffeeTypeFilterProvider.notifier)
              .update((state) => CoffeeType.coffeeDrinks);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Coffee Drinks",
                style: coffeeFilter == CoffeeType.coffeeDrinks
                    ? Utils.getSelectedStyle(context)
                    : Utils.getUnselectedStyle(context)),
            coffeeFilter == CoffeeType.coffeeDrinks
                ? const UnderLineContainer(height: 3, width: 55)
                : const SizedBox()
          ],
        ),
      ),
      TextButton(
        style: TextButton.styleFrom(padding: EdgeInsets.zero),
        onPressed: () {
          ref
              .read(coffeeTypeFilterProvider.notifier)
              .update((state) => CoffeeType.coffeeBags);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Coffee Bags",
                style: coffeeFilter == CoffeeType.coffeeBags
                    ? Utils.getSelectedStyle(context)
                    : Utils.getUnselectedStyle(context)),
            coffeeFilter == CoffeeType.coffeeBags
                ? const UnderLineContainer(width: 55, height: 3)
                : const SizedBox()
          ],
        ),
      ),
    ]);
  }
}
