import 'package:coffe_app/utils/constant/app_constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coffeeTypeFilterProvider =
    StateProvider<CoffeeType>((ref) => CoffeeType.coffeeDrinks);
