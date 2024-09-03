import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart'as sql;



class Sqlhelper{

  /// create tables
  static  createTables(sql.Database database){
    database.execute("""CREATE TABLE items(
      id INTEGER PRIMARY KEY NOT NULL,
      title TEXT,
      description TEXT, 
      createTime TIMESTAMP NOT NULL DEFAULT CURRENT TIME_STAMP,
    )
     """);
  }


  /// create a db
  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'demo.db',
      version: 1,
      onCreate : (sql.Database database, int version) async{
        await createTables(database);
      }
    );
  }
  static Future<int> createItem(String title, String? description) async{
    final db = await Sqlhelper.db();
    final data = {'title' : title, 'description' : description};
    final id = await db.insert(
      'items', data, conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  static Future<List<Map<String, dynamic>>> getItems() async{
    final db = await Sqlhelper.db();
    return db.query('items', orderBy: "id");
  }
  
  static Future<List<Map<String, dynamic>>>getItem(int id) async{
    final db = await Sqlhelper.db();
    return db.query('items' , where: "id =? ", whereArgs: [id], limit: 1);
  }
  /// update item
  static updateItem(String title, String description, int id) async {
    final db = await Sqlhelper.db();

    final data = {
      'title' : title,
      'description' : description,
      'createTime' : DateTime.now().toString(),
    };
    final result = await db.update('items', data, where:"id =?", whereArgs: [id]);
    return  result;
  }

  ///delete
   static delete(int id) async{
    final db = await Sqlhelper.db();

    try{
      await db.delete('items',where: " id =? ", whereArgs: [id]);
    }catch(err){
      debugPrint("Something went wrong when deleting an item: $err");
    }
   }


}