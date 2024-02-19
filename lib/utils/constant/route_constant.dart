class Page {
  const Page({required this.name, required this.path});
  final String name;
  final String path;
}

class AppRouter {
  static const Page homePage = Page(name: "home", path: "/");
  static const coffeeDetailsPage =
      Page(name: "coffeeDetails", path: "coffeeDetails");
  static const coffeeBagDetailsPage =
      Page(name: "coffeeBagDetails", path: "coffeeBagDetails");
  static const cartPage = Page(name: "cart", path: "/cart");
  static const favoritePage = Page(name: "favorite", path: "/favorite");
}
