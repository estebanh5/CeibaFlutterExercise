import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;
  static AppLocalizations of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'admission_test' : 'Admission Test',
      "search_user" : 'Search user',
      'see_posts_uppercase' : 'SEE POSTS'
    },
    'es': {
      'admission_test' : 'Prueba de Ingreso',
      'search_user' : 'Buscar usuario',
      'see_posts_uppercase' : 'VER PUBLICACIONES'
    },
  };

  static List<String> languages ()=> _localizedValues.keys.toList();

  String get admissionTest => _localizedValues[locale.languageCode]!['admission_test']!;

  String get searchUser => _localizedValues[locale.languageCode]!['search_user']!;

  String get seePosts => _localizedValues[locale.languageCode]!['see_posts_uppercase']!;
}