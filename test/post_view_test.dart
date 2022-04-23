import 'package:ceiba_flutter_exercise/localizations/app_localizations.dart';
import 'package:ceiba_flutter_exercise/models/post_data.dart';
import 'package:ceiba_flutter_exercise/screens/user_display/widgets/post_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  testWidgets('Checking if PostView is properly loaded', (WidgetTester tester) async {



    String title = 'sunt aut facere repellat provident occaecati excepturi optio reprehenderit';
    String body = 'quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto';

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

      home: PostView(post: PostData(id: 1, userId: 1, title: title,
          body: body
      ),),
    ));



    final titleFinder = find.text(title);
    final bodyFinder = find.text(body);


    expect(titleFinder, findsOneWidget);
    expect(bodyFinder, findsOneWidget);

  });
}