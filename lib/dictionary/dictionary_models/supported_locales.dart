
import 'package:flutter/material.dart';
import 'package:web_store/dictionary/data/ru.dart';
import 'package:web_store/dictionary/dictionary_models/supported_language.dart';

class SupportedLocales {
  List<SupportedLanguage> _supportedLocales;

  SupportedLocales._() {
    _supportedLocales = <SupportedLanguage>[
      SupportedLanguage(
        languageCode: 'ru',
        language: ru,
      )..choose(),
     /* SupportedLanguage(
        languageCode: 'ru',
        language: en,
      ),
      SupportedLanguage(
        languageCode: 'he',
        language: he,
      ),*/
    ];
  }

  static SupportedLocales instance = SupportedLocales._();

  void changeLocale(String languageCode) {
    _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.isSelected)?.discard();
    _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.languageCode == languageCode)?.choose();
  }

  List<Locale> get getSupportedLocales {
    return _supportedLocales?.map((SupportedLanguage supLang) => supLang.getLocale)?.toList() ?? <SupportedLanguage>[];
  }

  String get getCurrentLocale {
    return _supportedLocales?.firstWhere((SupportedLanguage supLang) => supLang.isSelected)?.languageCode ?? 'en';
  }

  SupportedLanguage getSupportedLanguage(Locale locale) {
    return _supportedLocales.firstWhere((SupportedLanguage supLang) => supLang.languageCode == locale.languageCode);
  }

}