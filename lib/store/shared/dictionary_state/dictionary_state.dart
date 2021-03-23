import 'dart:collection';

import 'package:web_store/dictionary/dictionary_models/language.dart';
import 'package:web_store/dictionary/flutter_dictionary.dart';
import 'package:web_store/res/locales.dart';
import 'package:web_store/store/reducer.dart';
import 'package:web_store/store/shared/dictionary_state/dictionary_actions.dart';

class DictionaryState {
  final Language language;
  final Map needsRequest;

  DictionaryState({
    this.language,
    this.needsRequest,
  });

  factory DictionaryState.initial() {
    FlutterDictionary.instance.setNewLanguage(Locales.ru);
    return DictionaryState(
      language: FlutterDictionary.instance.language,
     /* needsRequest: {
        HomePage: false,
        FavoritePage: false,
        FoundRecipesPage: false,
      },*/
    );
  }

  DictionaryState copyWith({
    Map needsRequest,
  }) {
    return DictionaryState(
      needsRequest: needsRequest ?? this.needsRequest,
      language: FlutterDictionary.instance.language,
    );
  }

  DictionaryState reducer(dynamic action) {
    return Reducer<DictionaryState>(
      actions: HashMap.from({
        ChangeLanguageAction: (dynamic action) => changeLanguage(action.code),
        SetNeedsRequestFromTypeAction : (dynamic action) => setNeedsRequestFromType(action.page),
        UnSetNeedsRequestFromTypeAction : (dynamic action) => unSetNeedsRequestFromType(action.page),
      }),
    ).updateState(action, this);
  }

  DictionaryState setNeedsRequestFromType(Type page){
    needsRequest[page] = true;
    return copyWith();
  }

  DictionaryState unSetNeedsRequestFromType(Type page){
    needsRequest[page] = false;
    return copyWith();
  }

  DictionaryState changeLanguage(String code) {
    FlutterDictionary.instance.setNewLanguage(code);
    return copyWith();
  }
}