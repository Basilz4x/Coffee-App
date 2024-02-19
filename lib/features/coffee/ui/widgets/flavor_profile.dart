import 'package:coffe_app/features/coffee/domain/coffee_bag.dart';
import 'package:coffe_app/features/coffee/ui/widgets/flavor_box.dart';
import 'package:flutter/material.dart';

class FlavorsProfile extends StatelessWidget {
  const FlavorsProfile({super.key, required this.coffeeBag});
  final CoffeeBag coffeeBag;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: coffeeBag.flavorProfile
          .map((flavor) => FlavorBox(flavor: flavor))
          .toList(),
    );
  }
}
