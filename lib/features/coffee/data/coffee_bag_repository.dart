import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:coffe_app/features/coffee/domain/coffee_bag.dart';

class CoffeeBagRepository {
  Future<List<CoffeeBag>> fetchAllCoffeeBag() async {
    final uri = Uri.parse("https://fake-coffee-api.vercel.app/api");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body) as List;
      final allCoffeeBag = data
          .map((jsonCoffeeBag) => CoffeeBag.fromJson(jsonCoffeeBag))
          .toList();
      return allCoffeeBag;
    } else {
      throw Exception("bad repository");
    }
  }
}

final fetchAllCoffeeBagProvider = FutureProvider((ref) {
  return CoffeeBagRepository().fetchAllCoffeeBag();
});
