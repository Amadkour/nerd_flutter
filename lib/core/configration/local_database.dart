import 'package:sqflite/sqflite.dart';

class MyDatabase {
  late Future<Database> instance;
  MyDatabase() {
    instance = _initDatabase;
  }

  ///create database
  Future<Database> get _initDatabase async {
    ///get database path on the target device
    final String databasePath = await getDatabasesPath();

    final String path = "$databasePath/recipe.db";

    return openDatabase(
      path,
      version: 1,
      onCreate: _createTables,
    );
  }

  Future<void> _createTables(Database db, _) async {
    await db.execute("""
                   CREATE TABLE $tableName (
                   id TEXT PRIMARY KEY 
                     )
                       """);
  }

  final String tableName = 'favorite';
}
