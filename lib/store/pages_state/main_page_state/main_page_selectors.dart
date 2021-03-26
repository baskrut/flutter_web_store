import 'package:redux/redux.dart';
import 'package:web_store/models/models/product.dart';
import 'package:web_store/store/app_state/app_state.dart';

class MainPageSelectors{
  static List<Product> getProducts(Store<AppState> store){
    return [...store.state.mainPageState.foundProducts];
  }
}