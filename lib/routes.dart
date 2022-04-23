import 'package:ceiba_flutter_exercise/screens/user_display/user_display.dart';
import 'package:ceiba_flutter_exercise/screens/users/users.dart';
import 'package:flutter/material.dart';

class Routes {
  Routes._();

  static const String usersPage = '/users';
  static const String userDisplayPage = "/user_display";

  static final dynamic routes = <String, WidgetBuilder>{
    usersPage: (BuildContext context) => const Users(),
    userDisplayPage: (BuildContext context) => const UserDisplay()
  };
}