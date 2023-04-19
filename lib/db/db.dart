import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:path/path.dart';

Future<Database> openDB() async {
  final database = openDatabase(
    join(await getDatabasesPath(), 'database.db'),
    onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE user(id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT, senha TEXT)',
      );
    },
    version: 1,
  );
  return database;
}

Future<List<Map<String, dynamic>>> getUsers() async {
  final db = await openDB();
  return db.query('user');
}