import 'package:ceiba_flutter_exercise/localizations/app_localizations.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:flutter/material.dart';

class UserDisplay extends StatefulWidget {
  const UserDisplay({Key? key}) : super(key: key);

  @override
  State<UserDisplay> createState() => _UserDisplayState();
}

class _UserDisplayState extends State<UserDisplay> {



  UserData? _user;

  @override
  void initState() {
    super.initState();


  }


  @override
  Widget build(BuildContext context) {

    _user = ModalRoute.of(context)!.settings.arguments as UserData;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).user),

      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [

                const SizedBox(height: 20,),

                SizedBox(width: double.infinity,
                child: Text(_user!.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),),

                const SizedBox(height: 10,),

                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                        children: [
                          const WidgetSpan(child: Icon(Icons.phone)),
                          TextSpan(text: " ${_user!.phone}", style: const TextStyle(color: Colors.black))

                        ]
                    ),
                  ),
                ),

                const SizedBox(height: 10,),

                SizedBox(
                  width: double.infinity,
                  child: RichText(
                    text: TextSpan(
                        children: [
                          const WidgetSpan(child: Icon(Icons.email)),

                          TextSpan(text: " ${_user!.email}", style: const TextStyle(color: Colors.black))

                        ]
                    ),
                  ),
                )


              ],
            ),)
          ),


          Expanded(
            flex: 2,
            child: Column(
              children: [

                Container(
                  width: double.infinity,
                  height: 40,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.grey
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(AppLocalizations.of(context).posts, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,),),
                  )
                ),


                const SizedBox(height: 10,),

                Expanded(
                  child: Container(),
                )


              ],
            ),
          )
        ],
      ),
    );
  }
}
