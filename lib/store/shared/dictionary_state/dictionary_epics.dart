import 'package:redux_epics/redux_epics.dart';
import 'package:web_store/store/app_state/app_state.dart';
import 'package:web_store/store/shared/dictionary_state/dictionary_actions.dart';
import 'package:rxdart/rxdart.dart';

class DictionaryEpics {
  static final indexEpic = combineEpics<AppState>([changeLanguageEpic]);

  static Stream<dynamic> changeLanguageEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<ChangeLanguageEpicAction>().switchMap(
          (action) async* {
        /*LocalStorageRepository.saveLanguage(action.code);
        print('Language SAVE${action.code}');

        DialogService.instance.show(MainLoaderDialog());

        if (GlobalStoreService.isSearchableIngredientsNotEmpty()) {
          yield SetNeedsRequestFromTypeAction(page: HomePage);
        }

        if (GlobalStoreService.isFavoritesNotEmpty()) {
          yield SetNeedsRequestFromTypeAction(page: FavoritePage);
        }

        if (GlobalStoreService.isFoundedRecipesNotEmpty()) {
          yield SetNeedsRequestFromTypeAction(page: FoundRecipesPage);
        }

        DialogService.instance.close();*/
      },
    );
  }
}