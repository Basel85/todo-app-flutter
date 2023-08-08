import 'package:sqflite/sqflite.dart';
class SqfliteHelper {
  static Database? _db;
  static Future<Database?> getInstance() async {
    _db = _db ?? await _initalizeDatabase();
    return _db;
  }
  static Future<Database> _initalizeDatabase() async {
    return await openDatabase("${await getDatabasesPath()}/todo.db", version: 1, onCreate: (db, version) {
      db.execute(
          'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, description TEXT, date TEXT, startTime TEXT, endTime TEXT, repeat TEXT, remind TEXT, color INTEGER)');
    });
  }
}
