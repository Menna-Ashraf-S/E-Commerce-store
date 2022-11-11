import 'package:flutter_pro/local/dbHelper_cart.dart';

class Carts {
  int? id;
  late int count;
  late String image;
  late String name;
  late double price;

  Carts({
    required this.id,
    required this.image,
    required this.name,
    required this.price,
    required this.count,
  });

  Carts.fromMap(Map<String, dynamic> map) {
    if (map[columnId] != null) id = map[columnId];
    name = map[columnName];
    image = map[columnImage];
    price = map[columnPrice];
    count = map[columnCount];
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {};
    if (id != null) map[columnId] = id;
    map[columnName] = name;
    map[columnPrice] = price;
    map[columnCount] = count;
    return map;
  }
}
