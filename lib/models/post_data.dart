import 'package:ceiba_flutter_exercise/constants/database_constants.dart';
import 'package:ceiba_flutter_exercise/constants/post_constants.dart';

class PostData {

  int id;
  String userId;
  String title;
  String body;

  PostData({required this.id, required this.userId, required this.title, required this.body});

  factory PostData.fromMap(Map<String, dynamic> map) =>
      PostData(
          id: map[PostConstants.idField],
          userId: map[PostConstants.userIdField],
          title: map[PostConstants.titleField],
          body: map[PostConstants.bodyField]
      );


  factory PostData.fromDatabaseMap(Map<String, dynamic> map) =>
      PostData(
      id: map[DatabaseConstants.idColumn],
      userId: map[DatabaseConstants.userIdColumn],
      title: map[DatabaseConstants.titleColumn],
      body: map[DatabaseConstants.bodyColumn]
      );


  Map<String, dynamic> toDatabaseMap() => {
    DatabaseConstants.idColumn: id,
    DatabaseConstants.userIdColumn: userId,
    DatabaseConstants.titleColumn: title,
    DatabaseConstants.bodyColumn: body
  };

}