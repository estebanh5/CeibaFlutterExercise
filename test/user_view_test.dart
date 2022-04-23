import 'package:ceiba_flutter_exercise/localizations/app_localizations.dart';
import 'package:ceiba_flutter_exercise/models/user_data.dart';
import 'package:ceiba_flutter_exercise/screens/users/widgets/user_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  testWidgets('Checking if UserView is properly loaded', (WidgetTester tester) async {




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

      home: UserView(user: UserData(id: 1, name: 'Leanne Graham', phone: '1-770-736-8031 x56442',
          email: 'Sincere@april.biz')),
    ));



    final nameFinder = find.text('Leanne Graham');
    final richText = find.byType(RichText);


    expect(nameFinder, findsOneWidget);
    expect(richText, findsWidgets);
  });
}
