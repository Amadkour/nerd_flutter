import 'package:nerd_flutter/core/configration/local_database.dart';

class FavoriteRepo {
  final MyDatabase db;

  FavoriteRepo({required this.db});

  Future<void> deleteItem({required String id}) async {
    await (await db.instance).delete(db.tableName, where: 'id=?', whereArgs: [id]);
  }

  Future<List<String>> getItems() async {
    return (await (await db.instance).query(db.tableName)).map((e) => e['id'] as String).toList();
  }

  Future<void> insertItem({required String id}) async {
    await (await db.instance).insert(db.tableName, {
      'id': id,
    });
  }
}
