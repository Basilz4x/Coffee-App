import 'package:coffe_app/features/coffee/domain/coffee_bag.dart';
import 'package:coffe_app/features/coffee/ui/widgets/grind_option_box.dart';
import 'package:flutter/material.dart';

class GrindOptions extends StatelessWidget {
  const GrindOptions({super.key, required this.coffeeBag});
  final CoffeeBag coffeeBag;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: coffeeBag.grindOption
          .map((e) => GrindOptionBox(
                grindOption: e,
              ))
          .toList(),
    );
  }
}
