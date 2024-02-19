import 'package:coffe_app/features/coffee/domain/coffee_bag.dart';
import 'package:coffe_app/features/coffee/ui/widgets/coffee_bag_item_container.dart';
import 'package:flutter/material.dart';

class CustomCoffeeBagGridView extends StatelessWidget {
  const CustomCoffeeBagGridView({super.key, required this.items});
  final List<CoffeeBag> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.80,
        mainAxisSpacing: 10,
      ),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return CoffeeBagItemContainer(coffeeBag: items[index]);
      },
    );
  }
}
