import 'package:ceiba_flutter_exercise/constants/user_constants.dart';

class UserData {

  String id;
  String name;
  String phone;
  String email;

  UserData({required this.id, required this.name, required this.phone, required this.email});

  factory UserData.fromMap(Map<String, dynamic> map) {
    return UserData(
        id: map[UserConstants.idField],
        name: map[UserConstants.nameField],
        phone: map[UserConstants.phoneField],
        email: map[UserConstants.emailField]);
  }

}