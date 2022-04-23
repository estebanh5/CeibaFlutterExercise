import 'package:ceiba_flutter_exercise/localizations/app_localizations.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:flutter/material.dart';

class UserView extends StatelessWidget {
  final UserData user;
  final Function(UserData)? onSeePosts;
  const UserView({Key? key, required this.user, this.onSeePosts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Padding(padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(user.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

            RichText(
              text: TextSpan(
                  children: [
                    const WidgetSpan(child: Icon(Icons.phone, color: Colors.green,)),
                    TextSpan(text: " ${user.phone}", style: const TextStyle(color: Colors.black))

                  ]
              ),
            ),

            RichText(
              text: TextSpan(
                  children: [
                    const WidgetSpan(child: Icon(Icons.email, color: Colors.green,)),

                    TextSpan(text: " ${user.email}", style: const TextStyle(color: Colors.black))

                  ]
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  child: Text(AppLocalizations.of(context).seePosts),
                  onPressed: () => onSeePosts?.call(user),
                ),
              ],
            ),

          ],
        ),)
    );
  }
}
