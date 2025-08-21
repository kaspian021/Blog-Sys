import 'dart:developer';

import 'package:blog_system_app/model/model_articles.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseArticles {
  DatabaseArticles.init();

  static final DatabaseArticles instance = DatabaseArticles.init();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _Init('dataArticles.db');

    return _database!;
  }

  Future<Database> _Init(String filePathDb) async {
    final pathDb = await getDatabasesPath();
    final path = join(pathDb, filePathDb);

    return openDatabase(path, version: 1, onCreate: _create);
  }

  Future _create(Database db, int version) async {
    """
      CREATE TABLE IF NOT EXISTS dataArticles(
        id INTEGER PRIMARY KEY,
        category TEXT NOT NULL,
        name TEXT NOT NULL,
        writer TEXT NOT NULL,
        date TEXT NOT NULL,
        desc TEXT NOT NULL,
        image_path TEXT NOT NULL,
        price INTEGER NOT NULL,
        like INTEGER NOT NULL
      )

    """;
  }

  Future<List> getArticlesAll()async{
    Database db = await database;

    final List<Map<String,dynamic>> data = await db.query('dataArticles',orderBy: 'date',);

    return List.generate(data.length, (index) {
      ModelArticles.fromJson(data[index],);
    },growable: false);
  }

  Future<void> setArticlesAll(List<ModelArticles> articles)async{

    Database db = await database;

    db.transaction((txn)async {
      
      await txn.delete('dataArticles',);
      for(var item in articles){
        await txn.insert('dataArticles', item.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
      }

    },);

  }

  Future<ModelArticles> getArticlebyId(int id)async{
    try {
      final Database db = await database;

      List<Map<String,dynamic>> data= await db.query('dataArticles',where: 'id = ?',whereArgs: [id]);
      if(data.isNotEmpty){
        return ModelArticles.fromJson(data.first);
      }
      log('Error database query: not get return by id');
      return ModelArticles(id: 0, category: '', name: '', writer: '', date: '', desc: '', image_path: '', price: 0, like: 0);
    } catch (e) {
      log("Error database : $e");
      return ModelArticles(id: 0, category: '', name: '', writer: '', date: '', desc: '', image_path: '', price: 0, like: 0);

    }
  }
  
}
