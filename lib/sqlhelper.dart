import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;

class SQLHelper {
  // Create table with title and description fields
  static Future<void> createTable(sql.Database database) async {
    await database.execute("""
    CREATE TABLE item(
      id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
      Username TEXT,
      Password TEXT,
      Email TEXT,
      title TEXT,
      description TEXT,
      createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    )""");
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'dbAuth.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTable(database);
      },
    );
  }

  // Create item in database with title and description
  static Future<int> createItem(String Username, String? Password, String? Email, String? title, String? description) async {
    final db = await SQLHelper.db();
    final data = {
      'Username': Username,
      'Password': Password,
      'Email': Email,
      'title': title,
      'description': description
    };
    final id = await db.insert('item', data, );
    return id;
  }

  // Get all items from the database
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('item', orderBy: "id");
  }

  // Get a specific item by id
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('item', where: "id = ?", whereArgs: [id], limit: 1);
  }

  // Update item by id with title and description
  static Future<int> updateItem(int id, String Username, String? Password, String? Email, String? title, String? description) async {
    final db = await SQLHelper.db();
    final data = {
      'Username': Username,
      'Password': Password,
      'Email': Email,
      'title': title,
      'description': description,
      'createdAt': DateTime.now().toString()
    };
    final result = await db.update('item', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

  // Delete an item by id
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("item", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }

  // Authentication with username and password
  static Future<bool>   authenticate(String Username, String Password) async {
    final db = await SQLHelper.db();
    final List<Map<String, dynamic>> result = await db.query(
      'item',
      where: 'username = ? AND password = ?',
      whereArgs: [Username, Password],
    );
    return result.isNotEmpty;
  }
}
