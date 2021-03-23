import 'package:redux/redux.dart';
import 'package:web_store/dictionary/dictionary_clases/main_dictionary.dart';
import 'package:web_store/store/app_state/app_state.dart';
import 'package:web_store/store/shared/dictionary_state/dictionary_selectors.dart';

class MainPageVM {
  final MainDictionary textContent;

  MainPageVM({this.textContent});

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(textContent: DictionarySelectors.language(store).mainDictionary);
  }
}
