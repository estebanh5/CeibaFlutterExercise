import 'package:ceiba_flutter_exercise/localizations/app_localizations.dart';
import 'package:ceiba_flutter_exercise/screens/users/users.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {



  testWidgets('Test if Users is correctly placed', (WidgetTester tester) async {



    await tester.pumpWidget(MaterialApp(
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

      home: const Users(),
    ));



    await tester.pump(const Duration(milliseconds: 10000));

    final usersList = find.byType(AppBar);


    expect(usersList, findsWidgets);


  });
}