import 'package:coffe_app/features/cart/doman/coffee_bag_cart_item.dart';
import 'package:coffe_app/features/cart/ui/page/cart_page_controller.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:input_quantity/input_quantity.dart';

class CoffeeBagDesign extends ConsumerWidget {
  const CoffeeBagDesign({super.key, required this.coffeeBag});
  final CoffeeBagCartItem coffeeBag;

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(14),
          child: SizedBox(
            width: 110,
            height: double.infinity,
            child: ColoredBox(
              color: AppColor.iconsColor,
              child: Transform.scale(
                scaleX: 2,
                scaleY: 1.35,
                child: Image.network(
                  coffeeBag.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              coffeeBag.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                  color: AppColor.textColor, fontWeight: FontWeight.bold),
            ),
            Text(
              Utils.getGrindOptionText(coffeeBag.grindOption.name),
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: AppColor.iconsColor),
            ),
            const Spacer(),
            InputQty.int(
              initVal: coffeeBag.quantity,
              minVal: 1,
              maxVal: 20,
              onQtyChanged: (value) {
                ref
                    .read(cartNotifierProvider.notifier)
                    .changeQuantity(coffeeBag, value);
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
                    .removeProductFromCart(coffeeBag);
              },
              child: Icon(
                Icons.close_rounded,
                size: 32,
                color: AppColor.iconsColor,
              ),
            ),
            const Spacer(),
            Text(
              "\$${coffeeBag.price}",
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
