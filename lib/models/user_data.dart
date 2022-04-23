import 'package:ceiba_flutter_exercise/constants/database_constants.dart';
import 'package:ceiba_flutter_exercise/constants/user_constants.dart';

class UserData {

  int id;
  String name;
  String phone;
  String email;

  UserData({required this.id, required this.name, required this.phone, required this.email});

  factory UserData.fromMap(Map<String, dynamic> map) =>
      UserData(
      id: map[UserConstants.idField],
      name: map[UserConstants.nameField],
      phone: map[UserConstants.phoneField],
      email: map[UserConstants.emailField]
      );


  factory UserData.fromDatabaseMap(Map<String, dynamic> map) =>
      UserData(
      id: map[DatabaseConstants.idColumn],
      name: map[DatabaseConstants.nameColumn],
      phone: map[DatabaseConstants.phoneColumn],
      email: map[DatabaseConstants.emailColumn]
      );



  Map<String, dynamic> toDatabaseMap() => {
    DatabaseConstants.idColumn: id,
    DatabaseConstants.nameColumn: name,
    DatabaseConstants.phoneColumn: phone,
    DatabaseConstants.emailColumn: email
  };



}