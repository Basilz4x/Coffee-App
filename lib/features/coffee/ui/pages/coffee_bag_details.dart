import 'package:coffe_app/features/cart/ui/page/cart_page_controller.dart';
import 'package:coffe_app/features/coffee/ui/pages/coffee_bag_details_controller.dart';
import 'package:coffe_app/features/coffee/domain/coffee_bag.dart';
import 'package:coffe_app/features/cart/doman/coffee_bag_cart_item.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/features/coffee/ui/widgets/custom_back_button.dart';
import 'package:coffe_app/features/coffee/ui/widgets/flavor_profile.dart';
import 'package:coffe_app/features/coffee/ui/widgets/grind_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:input_quantity/input_quantity.dart';

class CoffeeBagDetails extends ConsumerWidget {
  const CoffeeBagDetails({super.key, required this.coffeeBag});
  final CoffeeBag coffeeBag;
  @override
  Widget build(BuildContext context, ref) {
    final inputQtyCoffeeBag = ref.watch(inputQtyCoffeeBagProvider);
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(21),
          child: Column(children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.network(
                  coffeeBag.image,
                  height: 370,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  left: 105,
                  bottom: 45,
                  child: Container(
                    alignment: Alignment.center,
                    height: 58,
                    width: 58,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.transParentColor,
                        border:
                            Border.all(width: 2, color: AppColor.textColor)),
                    child: Text(
                      "\$${coffeeBag.price}",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColor.textColor),
                    ),
                  ),
                ),
                const Positioned(
                  top: 0,
                  child: CustomBackButton(),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  coffeeBag.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: AppColor.textColor),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  coffeeBag.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColor.textColor.withOpacity(0.8)),
                ),
                const SizedBox(
                  height: 18,
                ),
                FlavorsProfile(coffeeBag: coffeeBag),
                const SizedBox(
                  height: 24,
                ),
                GrindOptions(coffeeBag: coffeeBag),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InputQty.int(
                        initVal: inputQtyCoffeeBag,
                        minVal: 1,
                        maxVal: 20,
                        onQtyChanged: (value) {
                          ref
                              .read(inputQtyCoffeeBagProvider.notifier)
                              .update((state) => value);
                        },
                        qtyFormProps: QtyFormProps(
                            enableTyping: false,
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .copyWith(
                                  color: AppColor.textColor,
                                )),
                        decoration: QtyDecorationProps(
                          isBordered: false,
                          width: 7,
                          btnColor: AppColor.iconsColor,
                          minusBtn: Container(
                            color: AppColor.iconsColor,
                            child: Icon(
                              Icons.remove,
                              size: 32,
                              color: AppColor.mainColor,
                            ),
                          ),
                          plusBtn: Container(
                            color: AppColor.iconsColor,
                            child: Icon(
                              Icons.add,
                              size: 32,
                              color: AppColor.mainColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(9)),
                              elevation: 0,
                              backgroundColor: AppColor.iconsColor,
                              alignment: Alignment.centerLeft,
                            ),
                            onPressed: () {
                              int qunatity =
                                  ref.read(inputQtyCoffeeBagProvider);

                              final tempProduct = CoffeeBagCartItem(
                                  grindOption:
                                      ref.read(grindOptionTypeProvider),
                                  name: coffeeBag.name,
                                  description: coffeeBag.description,
                                  image: coffeeBag.image,
                                  quantity: qunatity,
                                  price: coffeeBag.price);

                              ref
                                  .read(cartNotifierProvider.notifier)
                                  .addProductToCart(tempProduct);
                            },
                            child: Text(
                              "Add To Cart",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(color: AppColor.textColor),
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
