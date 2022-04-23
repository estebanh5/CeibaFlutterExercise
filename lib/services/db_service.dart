import 'dart:io';

import 'package:ceiba_flutter_exercise/constants/database_constants.dart';
import 'package:ceiba_flutter_exercise/constants/user_constants.dart';
import 'package:ceiba_flutter_exercise/models/post_data.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  DBService._();

  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }


    _database = await _initDB();
    return _database!;
  }

  static Future<Database> _initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = "${documentsDirectory.path}/users.db";
    return await openDatabase(path, version: 1, onOpen: (db) {
    }, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE ${DatabaseConstants.usersTableName} ("
          "${UserConstants.idField} INTEGER PRIMARY KEY,"
          "${DatabaseConstants.nameColumn} TEXT,"
          "${DatabaseConstants.phoneColumn} TEXT,"
          "${DatabaseConstants.emailColumn} TEXT"
          ")");

      await db.execute("CREATE TABLE ${DatabaseConstants.postsTableName} ("
          "${UserConstants.idField} INTEGER PRIMARY KEY,"
          "${DatabaseConstants.userIdColumn} INTEGER,"
          "${DatabaseConstants.titleColumn} TEXT,"
          "${DatabaseConstants.bodyColumn} TEXT"
          ")");
    });
  }




  static Future<int> insertUser(UserData user) async{
    Database db = await database;
    await deleteUser(user.id.toString());
    return await db.insert(DatabaseConstants.usersTableName, user.toDatabaseMap());
  }

  static Future<int> deleteUser(String id) async {
    Database db = await database;
    return await db.delete(DatabaseConstants.usersTableName, where: "${DatabaseConstants.idColumn} = ?", whereArgs: [id]);
  }


  static Future<List<UserData>> getAllUsers() async {
    Database db = await database;

    List<Map<String, dynamic>> res = await db.query(DatabaseConstants.usersTableName);

    return res.map((e) => UserData.fromDatabaseMap(e)).toList();
  }

  static Future<List<UserData>> searchUsers(String query) async {
    Database db = await database;

    List<Map<String, dynamic>> res = await db.query(DatabaseConstants.usersTableName,
    where: "${DatabaseConstants.nameColumn} LIKE ?", whereArgs: ['%$query%']);

    return res.map((e) => UserData.fromDatabaseMap(e)).toList();
  }



  static Future<int> insertPost(PostData post) async {
    Database db = await database;
    await deletePost(post.id.toString());
    return await db.insert(DatabaseConstants.postsTableName, post.toDatabaseMap());
  }

  static Future<int> deletePost(String id) async {
    Database db = await database;
    return await db.delete(DatabaseConstants.postsTableName, where: "${DatabaseConstants.idColumn} = ?", whereArgs: [id]);
  }

  static Future<List<PostData>> getAllUserPosts(String userId) async {
    Database db = await database;

    List<Map<String, dynamic>> res = await db.query(DatabaseConstants.postsTableName, where: "${DatabaseConstants.userIdColumn} = ?", whereArgs: [userId]);

    return res.map((e) => PostData.fromDatabaseMap(e)).toList();
  }










}