import "dart:convert";

import 'package:coffe_app/features/coffee/domain/coffee.dart';
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:http/http.dart" as http;

class CoffeeRepository {
  Future<List<Coffee>> fetchAllCoffee() async {
    final uri = Uri.parse("https://api.sampleapis.com/coffee/hot");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      final allCoffee =
          data.map((jsonCoffee) => Coffee.fromJson(jsonCoffee)).toList();
      return allCoffee;
    } else {
      throw Exception("bad repository");
    }
  }
}

final fetchAllCoffeeProvider = FutureProvider((ref) {
  return CoffeeRepository().fetchAllCoffee();
});
