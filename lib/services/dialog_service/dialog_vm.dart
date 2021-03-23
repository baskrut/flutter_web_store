
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:web_store/dictionary/dictionary_clases/popup_dictionary.dart';
import 'package:web_store/store/app_state/app_state.dart';
import 'package:web_store/store/shared/dictionary_state/dictionary_selectors.dart';
import 'package:web_store/store/shared/navigation_state/navigation_selectors.dart';

class DialogViewModel {
  final PopUpDictionary textContent;
  // final bool isEmailError;
  // final bool isCodeError;
  final void Function() pop;
  // final void Function() logOut;
  // final void Function(int) removeFavorite;
  // final void Function(String) sendEmail;
  // final void Function(String email, String code) sendCode;
  // final void Function(String, String) sendPassword;
  final void Function(String route) push;

  DialogViewModel({
    @required this.textContent,
    @required this.pop,
    // @required this.logOut,
    // @required this.removeFavorite,
    @required this.push,
    // @required this.sendEmail,
    // @required this.sendCode,
    // @required this.sendPassword,
    // @required this.isEmailError,
    // @required this.isCodeError,
  });

  factory DialogViewModel.fromStore(Store<AppState> store) {
    return DialogViewModel(
      textContent: DictionarySelectors.language(store).popUpDictionary,
      pop: NavigationSelector.pop(store),
      // logOut: AuthSelectors.logOut(store),
      // removeFavorite: FavoritesSelectors.removeFromFavorites(store),
      push: NavigationSelector.push(store),
      // sendCode: AuthSelectors.acceptCode(store),
      // sendEmail: AuthSelectors.recover(store),
      // sendPassword: AuthSelectors.changePassword(store),
      // isEmailError: AuthSelectors.getIsEmailErrorValue(store),
      // isCodeError: AuthSelectors.getIsCodeErrorValue(store),
    );
  }
}
