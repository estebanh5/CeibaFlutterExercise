import 'package:ceiba_flutter_exercise/localizations/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.languages().contains(locale.languageCode);


  @override
  Future<AppLocalizations> load(Locale locale) => SynchronousFuture<AppLocalizations>(AppLocalizations(locale));

  @override
  bool shouldReload(AppLocalizationsDelegate old) => false;
}