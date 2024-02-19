class CartItem {
  CartItem({
    required this.name,
    required this.description,
    required this.image,
    required this.quantity,
    required this.price,
  });

  final String name;
  final String description;
  final String image;
  final int quantity;
  final double price;

  CartItem copyWith({
    String? name,
    String? description,
    String? image,
    int? quantity,
    double? price,
  }) {
    return CartItem(
      name: name ?? this.name,
      description: description ?? this.description,
      image: image ?? this.image,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}
