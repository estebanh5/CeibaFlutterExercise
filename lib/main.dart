import 'package:ceiba_flutter_exercise/localizations/app_localizations.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:ceiba_flutter_exercise/routes.dart';
import 'package:ceiba_flutter_exercise/screens/user_display/user_display.dart';
import 'package:ceiba_flutter_exercise/screens/users/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ceiba Test',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),

      onGenerateRoute: (settings) {


        if(settings.name == Routes.userDisplayPage) {

          UserData user = settings.arguments as UserData;
          return MaterialPageRoute(builder: (context) => UserDisplay(user: user));
        }
        return MaterialPageRoute(builder: (context) => const Users());


      },
      initialRoute: Routes.usersPage,
    );
  }
}

