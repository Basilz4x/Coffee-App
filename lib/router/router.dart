import 'package:coffe_app/features/cart/ui/page/cart_page.dart';
import 'package:coffe_app/features/coffee/domain/coffee.dart';
import 'package:coffe_app/features/coffee/domain/coffee_bag.dart';
import 'package:coffe_app/shared-widgets/app_bottom_navigator_bar.dart';
import 'package:coffe_app/features/coffee/ui/pages/coffee_bag_details.dart';
import 'package:coffe_app/features/coffee/ui/pages/coffee_details.dart';
import 'package:coffe_app/features/coffee/ui/pages/home_page.dart';
import 'package:coffe_app/utils/constant/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(navigatorKey: rootNavigatorKey, routes: [
  ShellRoute(
      navigatorKey: shellNavigatorKey,
      builder: (context, state, child) => AppBottomNavigatorBar(child: child),
      routes: [
        GoRoute(
          parentNavigatorKey: shellNavigatorKey,
          name: AppRouter.homePage.name,
          path: AppRouter.homePage.path,
          builder: (context, state) => const HomePage(),
          routes: [
            GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                name: AppRouter.coffeeDetailsPage.name,
                path: AppRouter.coffeeDetailsPage.path,
                builder: (context, state) {
                  Coffee coffee = state.extra as Coffee;
                  return CoffeeDetails(coffee: coffee);
                }),
            GoRoute(
                parentNavigatorKey: rootNavigatorKey,
                name: AppRouter.coffeeBagDetailsPage.name,
                path: AppRouter.coffeeBagDetailsPage.path,
                builder: (context, state) {
                  CoffeeBag coffeeBag = state.extra as CoffeeBag;
                  return CoffeeBagDetails(
                    coffeeBag: coffeeBag,
                  );
                }),
          ],
        ),
        GoRoute(
          parentNavigatorKey: shellNavigatorKey,
          name: AppRouter.cartPage.name,
          path: AppRouter.cartPage.path,
          builder: (context, state) => const CartPage(),
        ),
      ]),
]);
