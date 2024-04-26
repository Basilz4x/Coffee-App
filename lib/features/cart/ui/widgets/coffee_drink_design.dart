import 'package:coffe_app/features/cart/doman/coffee_cart_item.dart';
import 'package:coffe_app/features/cart/ui/page/cart_page_controller.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:input_quantity/input_quantity.dart';

class CoffeeDrinkDesign extends ConsumerWidget {
  const CoffeeDrinkDesign({super.key, required this.coffeeDrink});
  final CoffeeCartItem coffeeDrink;

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            width: 110,
            height: double.infinity,
            child: Image.network(
              coffeeDrink.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coffeeDrink.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColor.textColor, fontWeight: FontWeight.bold),
            ),
            Text(
              coffeeDrink.cupSize.name,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: AppColor.iconsColor),
            ),
            const Spacer(),
            InputQty.int(
              initVal: coffeeDrink.quantity,
              minVal: 1,
              maxVal: 20,
              onQtyChanged: (value) {
                ref
                    .read(cartNotifierProvider.notifier)
                    .changeQuantity(coffeeDrink, value);
              },
              qtyFormProps: QtyFormProps(
                  enableTyping: false,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: AppColor.textColor, fontSize: 19)),
              decoration: QtyDecorationProps(
                isBordered: false,
                width: 7,
                btnColor: AppColor.iconsColor,
                minusBtn: Container(
                  color: AppColor.iconsColor,
                  child: Icon(
                    Icons.remove,
                    size: 17,
                    color: AppColor.mainColor,
                  ),
                ),
                plusBtn: Container(
                  color: AppColor.iconsColor,
                  child: Icon(
                    Icons.add,
                    size: 17,
                    color: AppColor.mainColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            GestureDetector(
              onTap: () {
                ref
                    .read(cartNotifierProvider.notifier)
                    .removeProductFromCart(coffeeDrink);
              },
              child: Icon(
                Icons.close_rounded,
                size: 32,
                color: AppColor.iconsColor,
              ),
            ),
            const Spacer(),
            Text(
              "\$${coffeeDrink.price}",
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: AppColor.textColor, fontSize: 20),
            ),
          ],
        ),
      ],
    );
  }
}
