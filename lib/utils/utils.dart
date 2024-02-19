import 'package:coffe_app/features/cart/doman/cart_item.dart';
import 'package:coffe_app/features/coffee/ui/pages/coffee_bag_details_controller.dart';
import 'package:coffe_app/shared-widgets/app_bottom_navigator_bar.dart';
import 'package:coffe_app/utils/constant/app_constant.dart';
import 'package:coffe_app/utils/constant/color_constant.dart';
import 'package:coffe_app/utils/constant/route_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class Utils {
  static double getProudctsPrice(List<CartItem> products) {
    double productsAmount = 0;
    for (var product in products) {
      productsAmount = productsAmount + (product.quantity * product.price);
    }
    return productsAmount;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static TextStyle getSelectedStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: AppColor.iconsColor); 
  }

  static TextStyle getUnselectedStyle(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: AppColor.textColor); 
  }

  static String getGrindOptionText(String name) {
    if (name == GrindOptionType.wholeBean.name) {
      return "Whole Bean";
    }
    if (name == GrindOptionType.cafetiere.name) {
      return "Cafetiere";
    }
    if (name == GrindOptionType.espresso.name) {
      return "Espresso";
    }
    if (name == GrindOptionType.filter.name) {
      return "Filter";
    }
    if (name == GrindOptionType.frenchPress.name) {
      return "French Press";
    }
    if (name == GrindOptionType.pourOver.name) {
      return "Pour Over";
    }
    return "other";
  }

  static String getGrindOptionImage(String name) {
    switch (name.toLowerCase()) {
      case "whole bean":
        return "lib/assets/images/grind-option-whole-bean.png";
      case "cafetiere":
        return "lib/assets/images/grind-option-cafetiere.png";
      case "filter":
        return "lib/assets/images/grind-option-filter.png";
      case "espresso":
        return "lib/assets/images/grind-option-espresso.png";
      case "french press":
        return "lib/assets/images/grind-option-french-press.png";
      case "pour over":
        return "lib/assets/images/grind-option-pour-over.png";
      default:
        return "lib/assets/images/grind-option-other.png";
    }
  }

  static Color getGrindOptionColor(
      String name, GrindOptionType grindOptionType) {
    name = name.toLowerCase();
    if (name == "whole bean" && grindOptionType == GrindOptionType.wholeBean) {
      return AppColor.iconsColor;
    } else if (name == "espresso" &&
        grindOptionType == GrindOptionType.espresso) {
      return AppColor.iconsColor;
    } else if (name == "filter" && grindOptionType == GrindOptionType.filter) {
      return AppColor.iconsColor;
    } else if (name == "cafetiere" &&
        grindOptionType == GrindOptionType.cafetiere) {
      return AppColor.iconsColor;
    } else if (name == "french press" &&
        grindOptionType == GrindOptionType.frenchPress) {
      return AppColor.iconsColor;
    } else if (name == "pour over" &&
        grindOptionType == GrindOptionType.pourOver) {
      return AppColor.iconsColor;
    } else {
      return AppColor.transParentColor;
    }
  }

  static void getGridOptionFunction(String name, WidgetRef ref) {
    name = name.toLowerCase();

    if (name == "whole bean") {
      ref
          .read(grindOptionTypeProvider.notifier)
          .update((state) => GrindOptionType.wholeBean);
    } else if (name == "espresso") {
      ref
          .read(grindOptionTypeProvider.notifier)
          .update((state) => GrindOptionType.espresso);
    } else if (name == "filter") {
      ref
          .read(grindOptionTypeProvider.notifier)
          .update((state) => GrindOptionType.filter);
    } else if (name == "french press") {
      ref
          .read(grindOptionTypeProvider.notifier)
          .update((state) => GrindOptionType.frenchPress);
    } else if (name == "cafetiere") {
      ref
          .read(grindOptionTypeProvider.notifier)
          .update((state) => GrindOptionType.cafetiere);
    } else if (name == "pour over") {
      ref
          .read(grindOptionTypeProvider.notifier)
          .update((state) => GrindOptionType.pourOver);
    }
  }

  static int colorIndex = 0;
  static Color getFlavorOptionRandomColor(String name) {
    if (colorIndex == AppColor.randomColors.length) {
      colorIndex = 0;
    }
    return AppColor.randomColors[colorIndex++];
  }

  static void changeTap(int index, BuildContext context, WidgetRef ref) {
    switch (index) {
      case 0:
        context.goNamed(AppRouter.homePage.name);
        break;
      case 1:
        context.goNamed(AppRouter.cartPage.name);
        break;
      default:
        context.goNamed(AppRouter.homePage.name);
        break;
    }
    ref.read(bottomNavigatorIndexProvider.notifier).update((state) => index);
  }
}
