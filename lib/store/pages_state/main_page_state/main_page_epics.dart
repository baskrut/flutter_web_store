import 'package:web_store/models/models/product.dart';
import 'package:web_store/repositories/product_repository.dart';
import 'package:web_store/services/dialog_service/dialog_service.dart';
import 'package:web_store/store/app_state/app_state.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_store/store/pages_state/main_page_state/main_page_actions.dart';

class MainPageEpics{
  static final indexEpic = combineEpics<AppState>([fetchMainPageEpics]);

  static Stream<dynamic> fetchMainPageEpics(Stream<dynamic> actions, EpicStore<AppState> store){
    return actions.whereType<GetProductsAction>().switchMap((action) async*{
      // DialogService.instance.show(MainLoaderDialog());

      final List<Product> findProducts = await ProductRepository.getProducts();

    },);
  }
}