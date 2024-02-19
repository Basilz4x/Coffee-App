import 'package:coffe_app/features/cart/doman/cart_item.dart';
import 'package:coffe_app/utils/constant/app_constant.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomTotalPriceAndItemContainer extends StatelessWidget {
  const CustomTotalPriceAndItemContainer({super.key, required this.cartItems});
  final List<CartItem> cartItems;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 4),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 8,
        ),
        Center(
          child: Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            width: double.infinity,
            height: 125,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: AppColor.secondaryColor,
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Products",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColor.textColor, fontSize: 18),
                    ),
                    Text(
                      "Shipping",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColor.textColor, fontSize: 18),
                    ),
                    Text(
                      "Total",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColor.textColor, fontSize: 18),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      Utils.getProudctsPrice(cartItems).toStringAsFixed(2),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColor.textColor, fontSize: 18),
                    ),
                    Text(
                      shippingPrice.toStringAsFixed(1),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColor.textColor, fontSize: 18),
                    ),
                    Text(
                      (Utils.getProudctsPrice(cartItems) + shippingPrice)
                          .toStringAsFixed(2),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColor.textColor, fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
