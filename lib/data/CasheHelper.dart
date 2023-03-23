// ignore_for_file: unused_import, file_names

// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';

class CasheHelper {
  static Database? _db;
  static Database? _db2;

  //initialize the db :

//workout db
  Future<Database?> get() async {
    if (_db == null) {
      return await initialdatabase();
    } else {
      return _db;
    }
  }

  Future<Database?> get2() async {
    if (_db2 == null) {
      return await initialdatabase2();
    } else {
      return _db2;
    }
  }

//workout db
  Future<Database> initialdatabase() async {
    //default database location
    String databasepath = await getDatabasesPath();
    var path = join(databasepath, "workout.db");
    Database mydb = await openDatabase(path,
        onCreate: _oncreate, version: 1, onUpgrade: _onupgrade);
    return mydb;
  }

//exercise db
  Future<Database> initialdatabase2() async {
    String databasepath = await getDatabasesPath();
    var path = join(databasepath, "exercises.db");
    Database mydb = await openDatabase(path,
        onCreate: _oncreate2, version: 1, onUpgrade: _onupgrade);
    return mydb;
  }

//exercise db
  _oncreate2(Database db2, int version) async {
    await db2.execute('''
CREATE TABLE "exercises" 
(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT , workoutname Text NOT NULL, exercisename Text , sets INTEGER , reps INTEGER , weight REAL
) 
    ''');
  }

  _onupgrade(Database db, int oldversion, int newversion) {}

// initialize and build the table , workout db
  _oncreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "workout 1" 
(id INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT , workoutname Text
) 
''');
  }

//workout
  readData(String sql) async {
    Database? db = await get();
    List<Map<String, Object?>> response = await db!.rawQuery(sql);
    return response;
  }

  // exercise
  readData2(String sql) async {
    Database? db = await get2();
    List<Map<String, Object?>> response = await db!.rawQuery(sql);
    return response;
  }

//workout
  insertData(String sql) async {
    Database? db = await get();
    int response = await db!.rawInsert(sql);
    return response;
  }

  //exercise
  insertData2(String sql) async {
    Database? db = await get2();
    int response = await db!.rawInsert(sql);
    return response;
  }

//workout
  updateData(String sql) async {
    Database? db = await get();
    int response = await db!.rawUpdate(sql);
    return response;
  }

  //exercise
  updateData2(String sql, List<Object> list) async {
    Database? db = await get2();
    int response = await db!.rawUpdate(sql, list);
    return response;
  }

//workout
  deleteData(String sql) async {
    Database? db = await get();
    int response = await db!.rawDelete(sql);
    return response;
  }

  //exercise
  deleteData2(String sql) async {
    Database? db2 = await get2();
    int response = await db2!.rawDelete(sql);
    return response;
  }
}
