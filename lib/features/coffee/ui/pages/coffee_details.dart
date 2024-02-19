import 'package:coffe_app/features/cart/ui/page/cart_page_controller.dart';
import 'package:coffe_app/features/coffee/ui/pages/coffee_details_controller.dart';
import 'package:coffe_app/features/coffee/domain/coffee.dart';
import 'package:coffe_app/features/cart/doman/coffee_cart_item.dart';
import 'package:coffe_app/utils/constant/app_constant.dart';
import 'package:coffe_app/utils/utils.dart';
import 'package:coffe_app/features/coffee/ui/widgets/custom_back_button.dart';
import 'package:coffe_app/features/coffee/ui/widgets/item_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:input_quantity/input_quantity.dart';

import '../../../../utils/constant/color_constant.dart';

class CoffeeDetails extends ConsumerStatefulWidget {
  const CoffeeDetails({super.key, required this.coffee});
  final Coffee coffee;

  @override
  ConsumerState<CoffeeDetails> createState() => _CoffeeDetailsState();
}

class _CoffeeDetailsState extends ConsumerState<CoffeeDetails> {
  @override
  Widget build(BuildContext context) {
    final coffeeCupSize = ref.watch(coffeeCupSizeProvider);
    final inputQtyNum = ref.watch(inputQtyProvider);
    return Scaffold(
      backgroundColor: AppColor.mainColor,
      body: Stack(
        children: [
          SizedBox(
            width: Utils.screenWidth(context),
            height: Utils.screenHeight(context) / 1.80,
            child: Image.network(
              widget.coffee.image,
              fit: BoxFit.fill,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipPath(
              clipper: RoundedDiagonalPathClipper(),
              child: Container(
                height: Utils.screenHeight(context) / 1.70,
                color: AppColor.mainColor,
              ),
            ),
          ),
          Positioned(
            top: 435,
            right: 0,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.coffee.name,
                    style: Theme.of(context)
                        .textTheme
                        .headlineLarge!
                        .copyWith(color: AppColor.textColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const ItemRating(),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Description",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColor.iconsColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.coffee.description,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: AppColor.textColor),
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: [
                      Text(
                        "Quantity",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColor.iconsColor),
                      ),
                      const SizedBox(width: 150),
                      InputQty.int(
                        initVal: inputQtyNum,
                        minVal: 1,
                        maxVal: 20,
                        onQtyChanged: (value) {
                          ref
                              .read(inputQtyProvider.notifier)
                              .update((state) => value.toInt());
                        },
                        qtyFormProps: QtyFormProps(
                            enableTyping: false,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
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
                              size: 22,
                              color: AppColor.mainColor,
                            ),
                          ),
                          plusBtn: Container(
                            color: AppColor.iconsColor,
                            child: Icon(
                              Icons.add,
                              size: 22,
                              color: AppColor.mainColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 18,
                  ),
                  Text(
                    "Size",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: AppColor.iconsColor),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(children: [
                    TextButton(
                      onPressed: () {
                        ref
                            .read(coffeeCupSizeProvider.notifier)
                            .update((state) => CoffeeCupSize.small);
                      },
                      child: Text(
                        "Small",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: coffeeCupSize == CoffeeCupSize.small
                                ? AppColor.iconsColor
                                : AppColor.textColor),
                      ),
                    ),
                    const SizedBox(
                      width: 55,
                    ),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(coffeeCupSizeProvider.notifier)
                            .update((state) => CoffeeCupSize.medium);
                      },
                      child: Text(
                        "Medium",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: coffeeCupSize == CoffeeCupSize.medium
                                ? AppColor.iconsColor
                                : AppColor.textColor),
                      ),
                    ),
                    const SizedBox(
                      width: 55,
                    ),
                    TextButton(
                      onPressed: () {
                        ref
                            .read(coffeeCupSizeProvider.notifier)
                            .update((state) => CoffeeCupSize.large);
                      },
                      child: Text(
                        "Large",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: coffeeCupSize == CoffeeCupSize.large
                                ? AppColor.iconsColor
                                : AppColor.textColor),
                      ),
                    ),
                  ]),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    children: [
                      Text(
                        "\$${widget.coffee.price.toString()}",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: AppColor.iconsColor),
                      ),
                      const Spacer(),
                      SizedBox(
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: AppColor.iconsColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9),
                              )),
                          onPressed: () {
                            int qunatity = ref.read(inputQtyProvider);
                            ref
                                .read(cartNotifierProvider.notifier)
                                .addProductToCart(CoffeeCartItem(
                                    cupSize: coffeeCupSize,
                                    name: widget.coffee.name,
                                    description: widget.coffee.description,
                                    image: widget.coffee.image,
                                    quantity: qunatity,
                                    price: 10));
                          },
                          child: Text(
                            "Add To Cart",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    color: AppColor.textColor,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          const Positioned(
            top: 0,
            left: 35,
            child: CustomBackButton(),
          ),
        ],
      ),
    );
  }
}
