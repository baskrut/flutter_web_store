import 'package:flutter/foundation.dart';
import 'package:web_store/dictionary/dictionary_clases/auth_dictionary.dart';
import 'package:web_store/dictionary/dictionary_clases/cart_dictionary.dart';
import 'package:web_store/dictionary/dictionary_clases/item_dictionary.dart';
import 'package:web_store/dictionary/dictionary_clases/main_dictionary.dart';
import 'package:web_store/dictionary/dictionary_clases/popup_dictionary.dart';
import 'package:web_store/dictionary/dictionary_clases/settings_dictionary.dart';

class Language {
  final AuthDictionary authDictionary;
  final CartDictionary cartDictionary;
  final ItemDictionary itemDictionary;
  final MainDictionary mainDictionary;
  final SettingsDictionary settingsDictionary;
  final PopUpDictionary popUpDictionary;


  const Language({
    @required this.authDictionary,
    @required this.cartDictionary,
    @required this.itemDictionary,
    @required this.mainDictionary,
    @required this.popUpDictionary,
    @required this.settingsDictionary,
  });
}
