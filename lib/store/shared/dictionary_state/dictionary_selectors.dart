import 'package:redux/redux.dart';
import 'package:web_store/store/app_state/app_state.dart';
import 'package:web_store/store/shared/dictionary_state/dictionary_actions.dart';
import 'package:web_store/dictionary/dictionary_models/language.dart';

class DictionarySelectors {
  static void Function(String code) changeLanguage(Store<AppState> store) {
    return (code) {
      store.dispatch(ChangeLanguageAction(code: code));
      store.dispatch(ChangeLanguageEpicAction(code: code));
    };
  }
  static bool getNeedsRequestFromType(Store<AppState> store, Type page) {
    return store.state.dictionaryState.needsRequest[page];
  }
  static void Function(Type page) setNeedsRequestFromType(Store<AppState> store) {
    return (page) => store.dispatch(SetNeedsRequestFromTypeAction(page: page));
  }

  static Language language(Store<AppState> store) {
    return store.state.dictionaryState.language;
  }
}
