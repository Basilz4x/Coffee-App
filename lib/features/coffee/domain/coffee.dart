class Coffee {
  Coffee(
      {required this.name,
      required this.description,
      required this.image,
      this.price = 10});
  final String name;
  final String description;
  final String image;
  final int price;

  factory Coffee.fromJson(Map<String, dynamic> data) {
    return Coffee(
      name: data["title"],
      description: data["description"],
      image: data["image"],
    );
  }
}
