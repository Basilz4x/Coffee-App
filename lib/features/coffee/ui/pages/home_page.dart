import 'package:coffe_app/features/coffee/ui/pages/home_page_controller.dart';
import 'package:coffe_app/features/coffee/data/coffee_bag_repository.dart';
import 'package:coffe_app/features/coffee/data/coffee_repository.dart';
import 'package:coffe_app/utils/constant/app_constant.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/features/coffee/ui/widgets/custom_coffee_bag_gridview.dart';
import 'package:coffe_app/features/coffee/ui/widgets/coffee_type_filter.dart';
import 'package:coffe_app/features/coffee/ui/widgets/custom_coffee_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final asyncCoffee = ref.watch(fetchAllCoffeeProvider);
    final asyncCoffeeBag = ref.watch(fetchAllCoffeeBagProvider);

    final coffeeTypeFilter = ref.watch(coffeeTypeFilterProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.mainColor,
        surfaceTintColor: AppColor.mainColor,
        title: Text(
          "Coffee App",
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(color: AppColor.textColor),
        ),
      ),
      backgroundColor: AppColor.mainColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const CoffeeTypeFilter(),
                coffeeTypeFilter == CoffeeType.coffeeDrinks
                    ? asyncCoffee.when(
                        data: (data) {
                          return CustomCoffeeGridView(items: data);
                        },
                        error: (e, stack) {
                          throw Exception("error in .when");
                        },
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      )
                    : asyncCoffeeBag.when(data: (data) {
                        return CustomCoffeeBagGridView(items: data);
                      }, error: (e, stack) {
                        throw Exception("problem in .when 2");
                      }, loading: () {
                        return const CircularProgressIndicator();
                      })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
