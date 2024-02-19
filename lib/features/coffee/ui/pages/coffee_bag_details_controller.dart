import 'package:coffe_app/utils/constant/app_constant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final grindOptionTypeProvider = StateProvider.autoDispose<GrindOptionType>(
    (ref) => GrindOptionType.wholeBean);

final inputQtyCoffeeBagProvider = StateProvider.autoDispose<int>((ref) => 1);
