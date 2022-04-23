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
      child: Padding(padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(user.name),

            RichText(
              text: TextSpan(
                  children: [
                    const WidgetSpan(child: Icon(Icons.phone)),
                    TextSpan(text: user.phone)

                  ]
              ),
            ),

            RichText(
              text: TextSpan(
                  children: [
                    const WidgetSpan(child: Icon(Icons.email)),
                    TextSpan(text: user.email)

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
