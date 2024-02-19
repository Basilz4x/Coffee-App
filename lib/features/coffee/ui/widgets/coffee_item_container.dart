import 'package:coffe_app/features/cart/doman/coffee_cart_item.dart';
import 'package:coffe_app/features/coffee/domain/coffee.dart';
import 'package:coffe_app/features/coffee/ui/widgets/small_add_to_cart_button.dart';
import 'package:coffe_app/utils/constant/app_constant.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/utils/constant/route_constant.dart';
import 'package:coffe_app/features/coffee/ui/widgets/item_rating.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CoffeeItemContainer extends ConsumerWidget {
  const CoffeeItemContainer({super.key, required this.coffeeDrink});
  final Coffee coffeeDrink;

  @override
  Widget build(BuildContext context, ref) {
    return GestureDetector(
      onTap: () {
        Feedback.forTap(context);
        context.pushNamed(AppRouter.coffeeDetailsPage.name, extra: coffeeDrink);
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: AppColor.secondaryColor,
            borderRadius: BorderRadius.circular(18)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 115,
              width: double.infinity,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.network(
                  coffeeDrink.image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              coffeeDrink.name,
              style: Theme.of(context).textTheme.titleMedium!.copyWith(
                    color: AppColor.textColor,
                  ),
            ),
            const ItemRating(),
            Row(
              children: [
                Text("\$${coffeeDrink.price}",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColor.iconsColor,
                        )),
                const Spacer(),
                SmallAddToCartButton(
                    cartItem: CoffeeCartItem(
                  cupSize: CoffeeCupSize.small,
                  name: coffeeDrink.name,
                  description: coffeeDrink.description,
                  image: coffeeDrink.image,
                  quantity: 1,
                  price: 10,
                )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
