import 'package:ceiba_flutter_exercise/constants/publication_constants.dart';
import 'package:flutter/material.dart';

class PostData {

  String id;
  String userId;
  String title;
  String body;

  PostData({required this.id, required this.userId, required this.title, required this.body});

  factory PostData.fromMap(Map<String, dynamic> map) {
    return PostData(
        id: map[PublicationConstants.idField],
        userId: map[PublicationConstants.userIdField],
        title: map[PublicationConstants.titleField],
        body: map[PublicationConstants.bodyField]);
  }

}