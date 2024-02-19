import 'package:coffe_app/utils/constant/app_constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final coffeeCupSizeProvider =
    StateProvider.autoDispose((ref) => CoffeeCupSize.small);
final inputQtyProvider = StateProvider.autoDispose<int>((ref) => 1);
