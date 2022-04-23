import 'package:ceiba_flutter_exercise/localizations/app_localizations_delegate.dart';
import 'package:flutter/material.dart';

class AppLocalizations {
  AppLocalizations(this.locale);

  final Locale locale;
  static AppLocalizations of(BuildContext context) => Localizations.of<AppLocalizations>(context, AppLocalizations)!;

  static AppLocalizationsDelegate get delegate => const AppLocalizationsDelegate();

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'admission_test' : 'Admission Test',
      "search_user" : 'Search user',
      'enter_user_to_search' : 'Enter user to search',
      'see_posts_uppercase' : 'SEE POSTS',
      'list_is_empty' : 'List is empty',
      'user' : 'User',
      'posts' : 'Posts'
    },
    'es': {
      'admission_test' : 'Prueba de Ingreso',
      'search_user' : 'Buscar usuario',
      'enter_user_to_search' : 'Ingresar usuario para buscar',
      'see_posts_uppercase' : 'VER PUBLICACIONES',
      'list_is_empty' : 'La lista está vacía',
      'user' : 'Usuario',
      'posts' : 'Publicaciones'
    },
  };

  static List<String> languages ()=> _localizedValues.keys.toList();

  String get admissionTest => _localizedValues[locale.languageCode]!['admission_test']!;

  String get searchUser => _localizedValues[locale.languageCode]!['search_user']!;

  String get enterUsersToSearch => _localizedValues[locale.languageCode]!['enter_user_to_search']!;

  String get seePosts => _localizedValues[locale.languageCode]!['see_posts_uppercase']!;

  String get listIsEmpty => _localizedValues[locale.languageCode]!['list_is_empty']!;

  String get user => _localizedValues[locale.languageCode]!['user']!;

  String get posts => _localizedValues[locale.languageCode]!['posts']!;
}