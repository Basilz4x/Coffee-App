import 'package:coffe_app/features/cart/doman/coffee_bag_cart_item.dart';
import 'package:coffe_app/features/coffee/domain/coffee_bag.dart';
import 'package:coffe_app/features/coffee/ui/widgets/small_add_to_cart_button.dart';
import 'package:coffe_app/utils/constant/app_constant.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/utils/constant/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoffeeBagItemContainer extends StatelessWidget {
  const CoffeeBagItemContainer({super.key, required this.coffeeBag});
  final CoffeeBag coffeeBag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Feedback.forTap(context);
        context.pushNamed(AppRouter.coffeeBagDetailsPage.name,
            extra: coffeeBag);
      },
      child: Card(
        elevation: 0,
        color: AppColor.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      width: 110,
                      height: 110,
                      top: 3,
                      child: Container(
                          decoration: BoxDecoration(
                        color: AppColor.iconsColor,
                        shape: BoxShape.circle,
                      )),
                    ),
                    Positioned(
                      height: 210,
                      top: -25,
                      child: Image.network(
                        coffeeBag.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      top: 160,
                      child: Text(
                        coffeeBag.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColor.textColor),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Text("\$${coffeeBag.price}",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColor.iconsColor,
                          )),
                  const Spacer(),
                  SmallAddToCartButton(
                      cartItem: CoffeeBagCartItem(
                          grindOption: GrindOptionType.wholeBean,
                          name: coffeeBag.name,
                          description: coffeeBag.description,
                          image: coffeeBag.image,
                          quantity: 1,
                          price: coffeeBag.price)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
