import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';



class DatabaseUserAccount {

  DatabaseUserAccount._init();
  static final DatabaseUserAccount instance = DatabaseUserAccount._init();
  static Database? _database;

  Future<Database> get database async{

    if(_database!=null) return _database!;
    _database = await _initDb('userAccount.db');

    return _database!;

  }

  Future<Database> _initDb(String filePathDb)async{
    final pathDb = await getDatabasesPath();
    final path = join(pathDb, filePathDb);
    

    return openDatabase(path,version:1,onCreate: _create);

  }

  Future _create(Database db , int version)async{

    db.execute("""
    CREATE TABLE userAccount(
      id INTEGER PRIMARY KEY,
      seller BOOLEAN NOT NULL,
      isLoggedIn BOOLEAN NOT NULL,
      username TEXT NOT NULL
    
    )

""");
  }

  Future<void> insertUserAccount(Map<String, dynamic> row) async {
    final db = _database;
    await db!.insert('userAccount', row);
  }

  Future<List<Map<String, dynamic>>> getUserAccounts(int idUser) async {
    final db = _database;

    return await db!.query('userAccount',where: 'id = ?', whereArgs: [idUser]);
  }

  Future<void> updateUserToSeller(int idUser) async {
    final db= _database;

    db!.update('userAccount', {'seller':true},where: 'id = ?',whereArgs: [idUser]);
  }
  Future<void> updateUserToLoggin(int idUser) async {
    final db= _database;

    db!.update('userAccount', {'isLoggedIn':true},where: 'id = ?',whereArgs: [idUser]);
    
  }

  Future<void> deleteUserAccount(int idUser)async{
    final db= _database;

    db!.delete('userAccount',where: 'id = ?',whereArgs: [idUser]);
    
  }

  


}