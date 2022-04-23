import 'dart:io';

import 'package:ceiba_flutter_exercise/constants/endpoints.dart';
import 'package:ceiba_flutter_exercise/models/post_data.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:ceiba_flutter_exercise/services/db_service.dart';
import 'package:dio/dio.dart';

class Services {
  Services._();

  static Future<List<UserData>> getUsers() async{

    if (!Platform.environment.containsKey('FLUTTER_TEST')) {


      List<UserData> users = await DBService.getAllUsers();

      if (users.isNotEmpty) {
        return users;
      } else {
        var response = await Dio().get(Endpoint.usersEndPoint);
        List<dynamic> body = response.data;

        List<UserData> usersList = body.map((data) => UserData.fromMap(data))
            .toList();

        for (UserData userData in usersList) {
          await DBService.insertUser(userData);
        }

        return usersList;
      }


    }else {


      var response = await Dio().get(Endpoint.usersEndPoint);
      List<dynamic> body = response.data;
      return body.map((data) => UserData.fromMap(data))
          .toList();
    }

  }




  static Future<List<PostData>> getPosts(String userId) async{

    if (!Platform.environment.containsKey('FLUTTER_TEST')) {


      List<PostData> posts = await DBService.getAllUserPosts(userId);

      if (posts.isNotEmpty) {
        return posts;
      } else {
        var response = await Dio().get(
            "${Endpoint.postsEndPoint}?userId=$userId");

        List<dynamic> body = response.data;

        List<PostData> postsList = body.map((data) => PostData.fromMap(data))
            .toList();

        for (PostData postData in postsList) {
          await DBService.insertPost(postData);
        }

        return postsList;
      }

    }else {
      var response = await Dio().get(
          "${Endpoint.postsEndPoint}?userId=$userId");

      List<dynamic> body = response.data;

      return body.map((data) => PostData.fromMap(data))
          .toList();
    }



  }





}