class CoffeeBag {
  final String name;
  final String description;
  final String image;
  final double price;
  final String region;
  final List<String> grindOption;
  final List<String> flavorProfile;

  CoffeeBag({
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.region,
    required this.grindOption,
    required this.flavorProfile,
  });

  factory CoffeeBag.fromJson(Map<String, dynamic> data) {
    return CoffeeBag(
      name: data["name"],
      description: data["description"],
      image: data["image_url"],
      price: data["price"],
      region: data["region"],
      grindOption: List<String>.from(data["grind_option"]),
      flavorProfile: List<String>.from(data["flavor_profile"]),
    );
  }
}
