import 'package:ceiba_flutter_exercise/constants/endpoints.dart';
import 'package:ceiba_flutter_exercise/models/post_data.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:ceiba_flutter_exercise/services/db_service.dart';
import 'package:dio/dio.dart';

class Services {
  Services._();

  static Future<List<UserData>> getUsers() async{

      List<UserData> users = await DBService.getAllUsers();


      if(users.isNotEmpty) {
        return users;

      }else {

        var response = await Dio().get(Endpoint.usersEndPoint);
        List<dynamic> body = response.data;

        List<UserData> usersList = body.map((data) => UserData.fromMap(data)).toList();

        for(UserData userData in usersList) {
          await DBService.insertUser(userData);
        }

        return usersList;


      }

  }




  static Future<List<PostData>> getPosts(String userId) async{

    var response = await Dio().get("${Endpoint.postsEndPoint}?userId=$userId");

    List<dynamic> body = response.data;

    return body.map((data) => PostData.fromMap(data)).toList();

  }





}