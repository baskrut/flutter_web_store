
import 'package:redux/redux.dart';
import 'package:web_store/store/app_state/app_state.dart';
import 'package:web_store/store/pages_state/auth_page_state/auth_page_actions.dart';

class AuthSelectors {
  /*static bool getIsSignInValue(Store<AppState> store) {
    return store.state.authState.isSignIn;
  }

  static bool getIsEmailErrorValue(Store<AppState> store) {
    return store.state.authState.isRecoverEmailError;
  }

  static bool getIsCodeErrorValue(Store<AppState> store) {
    return store.state.authState.isCodeError;
  }

  static bool getIsAndroid(Store<AppState> store) {
    return store.state.authState.isAndroid;
  }

  static bool getObscureValue(Store<AppState> store) {
    return store.state.authState.obscureText;
  }

  static void Function() changeAuthPage(Store<AppState> store) {
    return () => store.dispatch(ChangeAuthPageAction());
  }

  static void Function(String email) recover(Store<AppState> store) {
    return (String email) => store.dispatch(RecoverAction(email: email));
  }

  static void Function(
      String email,
      String code,
      ) acceptCode(Store<AppState> store) {
    return (
        String email,
        String code,
        ) =>
        store.dispatch(AcceptCodeAction(
          email: email,
          code: code,
        ));
  }

  static void Function(
      String email,
      String password,
      ) changePassword(Store<AppState> store) {
    return (
        String email,
        String password,
        ) =>
        store.dispatch(ChangePasswordAction(email: email, password: password));
  }

  static void Function(User user) register(Store<AppState> store) {
    return (User user) => store.dispatch(RegisterAction(user: user));
  }

  static void Function(User user) signIn(Store<AppState> store) {
    return (User user) => store.dispatch(SignInAction(user: user));
  }

  static void Function() logOut(Store<AppState> store) {
    return () => store.dispatch(LogOutAction());
  }

  static void Function() signInGoogle(Store<AppState> store) {
    return () => store.dispatch(SignInGoogleAction());
  }

  static Token getToken(Store<AppState> store) {
    return store.state.authState.token;
  }*/
}
