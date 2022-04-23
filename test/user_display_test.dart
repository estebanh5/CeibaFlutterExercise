import 'package:ceiba_flutter_exercise/localizations/app_localizations.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:ceiba_flutter_exercise/screens/user_display/user_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  testWidgets('Test if UserDisplay is correctly placed', (WidgetTester tester) async {



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

        home: UserDisplay(user: UserData(id: 1, name: 'Leanne Graham', phone: '1-770-736-8031 x56442',
            email: 'Sincere@april.biz'),),
    ));


    await tester.pump(const Duration(milliseconds: 500));

    final nameFinder = find.text('Leanne Graham');
    expect(nameFinder, findsOneWidget);


  });
}
