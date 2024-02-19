import 'package:coffe_app/features/coffee/domain/coffee.dart';
import 'package:coffe_app/features/coffee/ui/widgets/coffee_item_container.dart';
import 'package:flutter/material.dart';

class CustomCoffeeGridView extends StatelessWidget {
  const CustomCoffeeGridView({super.key, required this.items});
  final List<Coffee> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.80,
          crossAxisSpacing: 20,
          mainAxisSpacing: 28),
      itemBuilder: (BuildContext context, int index) {
        return CoffeeItemContainer(coffeeDrink: items[index]);
      },
    );
  }
}
