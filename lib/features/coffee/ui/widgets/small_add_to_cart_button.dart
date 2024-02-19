import 'package:coffe_app/features/cart/doman/cart_item.dart';
import 'package:coffe_app/features/cart/doman/coffee_bag_cart_item.dart';
import 'package:coffe_app/features/cart/doman/coffee_cart_item.dart';
import 'package:coffe_app/features/cart/ui/page/cart_page_controller.dart';
import 'package:coffe_app/utils/constant/app_constant.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SmallAddToCartButton extends ConsumerWidget {
  const SmallAddToCartButton({super.key, required this.cartItem});
  final CartItem cartItem;
  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        if (cartItem is CoffeeCartItem) {
          ref.read(cartNotifierProvider.notifier).addProductToCart(
                CoffeeCartItem(
                    cupSize: CoffeeCupSize.small,
                    name: cartItem.name,
                    description: cartItem.description,
                    image: cartItem.image,
                    quantity: 1,
                    price: 10),
              );
        }
        if (cartItem is CoffeeBagCartItem) {
          ref.read(cartNotifierProvider.notifier).addProductToCart(
              CoffeeBagCartItem(
                  grindOption: GrindOptionType.wholeBean,
                  name: cartItem.name,
                  description: cartItem.description,
                  image: cartItem.image,
                  quantity: 1,
                  price: cartItem.price));
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColor.iconsColor,
        ),
        child: Icon(
          Icons.add,
          size: 20,
          color: AppColor.secondaryColor,
        ),
      ),
    );
  }
}
