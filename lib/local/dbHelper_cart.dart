import 'package:flutter_pro/local/cart_SQL.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String columnId = 'id';
final String columnName = 'name';
final String columnImage = 'image';
final String columnPrice = 'price';
final String columnCount = 'count';
final String recipeTable = 'recipe_table';

class CartHelper {
  late Database db;
  static final CartHelper instance = CartHelper._internal();

  factory CartHelper() {
    return instance;
  }
  CartHelper._internal();
  Future open() async {
    db = await openDatabase(join(await getDatabasesPath(), 'cart_List.db'),
        version: 1, onCreate: (Database db, int version) async {
          await db.execute('''
          create table cartTable (
          $columnId integer not null,
          $columnCount integer not null,
          $columnPrice real not null,
          $columnName text not null,
          $columnImage text not null
          )
          ''');
        });
  }

  Future<int?> insertCart(Carts cart) async {
    cart.id = await db.insert('cartTable', cart.toMap());
    return cart.id ;
  }

  Future<int> deleteCart(int id) async {
    return await db
        .delete('cartTable', where: '$columnId = ?', whereArgs: [id]);
  }

  Future<List<Carts>> getAllRecipes() async {
    List<Map<String, dynamic>> CartMaps = await db.query('cartTable');
    if (CartMaps.isEmpty) {
      return [];
    } else {
      List<Carts> carts = [];
      for (var element in CartMaps) {
        carts.add(Carts.fromMap(element));
      }
      return carts;
    }
  }

  Future close() async => db.close();
}
