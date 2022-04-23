import 'package:ceiba_flutter_exercise/localizations/app_localizations.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:ceiba_flutter_exercise/routes.dart';
import 'package:ceiba_flutter_exercise/screens/users/widgets/user_view.dart';
import 'package:ceiba_flutter_exercise/services/db_service.dart';
import 'package:ceiba_flutter_exercise/services/services.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {


  final List<Widget> _users = [];
  bool _loadingUsers = false;

  @override
  void initState() {
    super.initState();

    _loadUsers();
  }

  void _loadUsers () async{

    setState(() {
      _loadingUsers = true;
      _users.clear();
    });

    List<UserData> usersList = await Services.getUsers();


    for(UserData user in usersList) {
      _users.add(UserView(user: user, onSeePosts: _openUserDisplay,));
    }

    setState(() {
      _loadingUsers = false;
    });

  }


  void _searchUsers(String query) async{

    setState(() {
      _users.clear();
    });

    List<UserData> searchList = await DBService.searchUsers(query);

    for(UserData user in searchList) {
      _users.add(UserView(user: user, onSeePosts: _openUserDisplay,));
    }

    setState(() {

    });
  }


  void _openUserDisplay(UserData user) {
    Navigator.pushNamed(context, Routes.userDisplayPage, arguments: user);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).admissionTest,),
      ),
      body: Column(
        children: [

          const SizedBox(height: 10,),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context).searchUser,
                hintText: AppLocalizations.of(context).enterUsersToSearch
              ),
              onChanged: (value) {

                if(value.isNotEmpty) {
                  _searchUsers(value);
                }else {
                  _loadUsers();
                }


              }
            ),
          ),


          const SizedBox(height: 10,),

          Expanded(
            child: !_loadingUsers? SingleChildScrollView(
              child: _users.isNotEmpty? Column(
                children: _users,
              ) : Column(
                children: [
                  Text(AppLocalizations.of(context).listIsEmpty, textAlign: TextAlign.center,)
                ],
              ),
            ) : Column(
              children: const [

                SizedBox(
                  width: double.infinity,
                  height: 40,
                  child: Align(
                    alignment: Alignment.center,
                    child: FittedBox(
                      child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.green),),
                    ),
                  ),
                )
              ],
            ),
          )



        ],
      ),
    );
  }
}
