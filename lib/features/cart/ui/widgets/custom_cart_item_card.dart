import 'package:coffe_app/features/cart/doman/cart_item.dart';
import 'package:coffe_app/features/cart/doman/coffee_bag_cart_item.dart';
import 'package:coffe_app/features/cart/doman/coffee_cart_item.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/features/cart/ui/widgets/coffee_bag_design.dart';
import 'package:coffe_app/features/cart/ui/widgets/coffee_drink_design.dart';
import 'package:flutter/material.dart';

class CustomCartItemCard extends StatelessWidget {
  const CustomCartItemCard({super.key, required this.cartItem});
  final CartItem cartItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 8, left: 9, right: 9),
        child: SizedBox(
          height: 125,
          width: double.infinity,
          child: Card(
            elevation: 0,
            color: AppColor.secondaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
              child: cartItem is CoffeeCartItem
                  ? CoffeeDrinkDesign(
                      coffeeDrink: cartItem as CoffeeCartItem,
                    )
                  : cartItem is CoffeeBagCartItem
                      ? CoffeeBagDesign(
                          coffeeBag: cartItem as CoffeeBagCartItem,
                        )
                      : const SizedBox(),
            ),
          ),
        ));
  }
}
