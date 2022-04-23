import 'package:ceiba_flutter_exercise/localizations/app_localizations.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:ceiba_flutter_exercise/screens/users/widgets/user_view.dart';
import 'package:ceiba_flutter_exercise/services/services.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  const Users({Key? key}) : super(key: key);

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).admissionTest,),
        centerTitle: true,
      ),
      body: Column(
        children: [

          const SizedBox(height: 10,),

          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context).searchUser
              ),
              onChanged: (value) {

              }
            ),
          ),


          const SizedBox(height: 10,),


        ],
      ),
    );
  }
}
