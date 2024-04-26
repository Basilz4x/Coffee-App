import 'package:coffe_app/features/cart/doman/cart.dart';
import 'package:coffe_app/features/cart/doman/cart_item.dart';
import 'package:coffe_app/features/cart/doman/coffee_bag_cart_item.dart';
import 'package:coffe_app/features/cart/doman/coffee_cart_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends StateNotifier<Cart> {
  CartNotifier()
      : super(Cart(
          products: [],
        ));

  addProductToCart(CartItem newProduct) {
    try {
      List<CartItem> updatedProduct = List.of(state.products);

      int productIndex = -1;
      if (newProduct is CoffeeCartItem) {
        for (int i = 0; i < updatedProduct.length; i++) {
          final currentProduct = updatedProduct[i];
          if (currentProduct is CoffeeCartItem) {
            if (currentProduct.name == newProduct.name &&
                currentProduct.cupSize == newProduct.cupSize) {
              productIndex = i;
            }
          }
        }
      }

      if (newProduct is CoffeeBagCartItem) {
        for (int i = 0; i < updatedProduct.length; i++) {
          final currentProduct = updatedProduct[i];
          if (currentProduct is CoffeeBagCartItem) {
            if (currentProduct.name == newProduct.name &&
                currentProduct.grindOption == newProduct.grindOption) {
              productIndex = i;
            }
          }
        }
      }

      if (productIndex != -1) {
        final currentQuantity = updatedProduct[productIndex].quantity;

        CartItem currentProduct = updatedProduct[productIndex];
        currentProduct = currentProduct.copyWith(
            quantity: currentQuantity + newProduct.quantity);
        updatedProduct[productIndex] = currentProduct;
      } else {
        updatedProduct.add(newProduct);
      }
      state = Cart(products: updatedProduct);
    } catch (e) {
      throw "error in addProductToCart";
    }
  }

  void removeProductFromCart(CartItem product) {
    List<CartItem> productsList = List.of(state.products);

    productsList.removeWhere((p) => p.name == product.name);

    state = Cart(products: productsList);
  }

  void changeQuantity(CartItem cartItem, int value) {
    final productList = List.of(state.products);
    if (cartItem is CoffeeCartItem) {
      int index = state.products.indexWhere((item) {
        if (item is CoffeeCartItem) {
          return item.name == cartItem.name && cartItem.cupSize == item.cupSize;
        }
        return false;
      });
      productList[index] = productList[index].copyWith(quantity: value);
    }
    if (cartItem is CoffeeBagCartItem) {
      int index = state.products.indexWhere((item) {
        if (item is CoffeeBagCartItem) {
          return item.name == cartItem.name &&
              cartItem.grindOption == item.grindOption;
        }
        return false;
      });
      productList[index] = productList[index].copyWith(quantity: value);
    }
    state = Cart(products: productList);
  }

  void clearCart() {
    state = Cart(products: []);
  }
}

final cartNotifierProvider =
    StateNotifierProvider<CartNotifier, Cart>((ref) => CartNotifier());
