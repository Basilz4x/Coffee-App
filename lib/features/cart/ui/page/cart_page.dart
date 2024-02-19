import 'package:coffe_app/features/cart/ui/page/cart_page_controller.dart';
import 'package:coffe_app/features/cart/ui/page/custom_total_price_and_item_container.dart';
import 'package:coffe_app/features/cart/ui/widgets/empty_cart_design.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/features/cart/ui/widgets/custom_cart_item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final cart = ref.watch(cartNotifierProvider);

    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Cart",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(color: AppColor.textColor),
                  ),
                  cart.products.isEmpty
                      ? const SizedBox()
                      : TextButton(
                          onPressed: () {
                            ref.read(cartNotifierProvider.notifier).clearCart();
                          },
                          child: Text(
                            "Clear",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: AppColor.textColor),
                          ),
                        ),
                ],
              ),
            ),
            cart.products.isEmpty
                ? const Column(children: [
                    SizedBox(
                      height: 80,
                    ),
                    EmptyCartDesign()
                  ])
                : SizedBox(
                    height: 530,
                    child: ListView.builder(
                        itemCount: cart.products.length,
                        itemBuilder: (context, index) {
                          return CustomCartItemCard(
                            cartItem: cart.products[index],
                          );
                        })),
            cart.products.isEmpty
                ? const SizedBox()
                : CustomTotalPriceAndItemContainer(cartItems: cart.products),
            const SizedBox(
              height: 4,
            ),
            cart.products.isEmpty
                ? const SizedBox()
                : SizedBox(
                    height: 45,
                    width: 310,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9)),
                        elevation: 0,
                        backgroundColor: AppColor.iconsColor,
                      ),
                      onPressed: () {},
                      child: Text(
                        "Check Out",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColor.textColor),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
