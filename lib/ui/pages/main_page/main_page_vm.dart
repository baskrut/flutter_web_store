import 'package:redux/redux.dart';
import 'package:web_store/dictionary/dictionary_clases/main_dictionary.dart';
import 'package:web_store/models/models/product.dart';
import 'package:web_store/store/app_state/app_state.dart';
import 'package:web_store/store/pages_state/main_page_state/main_page_selectors.dart';
import 'package:web_store/store/shared/dictionary_state/dictionary_selectors.dart';

class MainPageVM {
  final MainDictionary textContent;
  final List<Product> findProducts;

  MainPageVM({
    this.textContent,
    this.findProducts,
  });

  static MainPageVM fromStore(Store<AppState> store) {
    return MainPageVM(
      textContent: DictionarySelectors.language(store).mainDictionary,
      findProducts: MainPageSelectors.getProducts(store),
    );
  }
}
