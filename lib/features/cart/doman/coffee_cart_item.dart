import 'package:coffe_app/features/cart/doman/cart_item.dart';
import 'package:coffe_app/utils/constant/app_constant.dart';

class CoffeeCartItem extends CartItem {
  CoffeeCartItem({
    required this.cupSize,
    required super.name,
    required super.description,
    required super.image,
    required super.quantity,
    required super.price,
  });

  final CoffeeCupSize cupSize;

  @override
  CoffeeCartItem copyWith({
    String? name,
    String? description,
    String? image,
    int? quantity,
    double? price,
  }) {
    return CoffeeCartItem(
        cupSize: cupSize,
        name: name ?? this.name,
        description: description ?? this.description,
        image: image ?? this.image,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price);
  }
}
