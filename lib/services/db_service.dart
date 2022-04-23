import 'dart:io';

import 'package:ceiba_flutter_exercise/constants/database_constants.dart';
import 'package:ceiba_flutter_exercise/constants/user_constants.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  DBService._();

  static final DBService db = DBService._();


  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }


    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentsDirectory.path}/users.db";
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE ${DatabaseConstants.usersTableName} ("
          "${UserConstants.idField} INTEGER PRIMARY KEY,"
          "first_name TEXT,"
          "last_name TEXT,"
          "blocked BIT"
          ")");
    });
  }

}