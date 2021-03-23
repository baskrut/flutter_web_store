import 'dart:convert';
// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux_epics/redux_epics.dart';
// import 'package:http/http.dart';
// import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';
import 'package:web_store/store/app_state/app_state.dart';
// import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:web_store/store/app_state/app_state.dart';
import 'package:web_store/store/pages_state/auth_page_state/auth_page_actions.dart';

class AuthStateEpics {
  static final indexEpic = combineEpics<AppState>([
   /* registerEpic,
    signInEpic,
    logOutEpic,
    signInGoogleEpic,
    recoverEpic,
    acceptCodeEpic,
    changePasswordEpic,*/
  ]);

 /* static Stream<dynamic> registerEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<RegisterAction>().switchMap((action) async* {
      await NotificationsService.messaging.setAutoInitEnabled(true);
      final User user = action.user;
      final Response response = await HttpService.register(
        password: user.password,
        email: user.email,
        firstName: user.firstName,
      );

      // TODO: json decode and from DTO should be in adapter. Don't do it in Epics
      final jsonData = json.decode(response.body);

      final Token token = Token.fromDTO(TokenDTO.fromJson(jsonData));

      LocalStorageRepository.saveToken(token.token);
      LocalStorageRepository.saveRefreshToken(token.refreshToken);
      final String ttl = DateTime.now().add(Duration(hours: 1)).toString();
      LocalStorageRepository.saveTtl(ttl);
      LocalStorageRepository.saveUserEmail(user.email);
      yield AddTokenAction(token: token);
      yield NavigateToAction.replace(Routes.kOnboarding);
    });
  }

  static Stream<dynamic> signInEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<SignInAction>().switchMap((action) async* {
      await NotificationsService.messaging.setAutoInitEnabled(true);
      final User user = action.user;
      final Response response = await HttpService.signIn(
        password: user.password,
        email: user.email,
      );
      // TODO: json decode and from DTO should be in adapter. Don't do it in Epics
      // TODO epic > repositry > adapter > request
      final jsonData = json.decode(response.body);

      final Token token = Token.fromDTO(TokenDTO.fromJson(jsonData));

      LocalStorageRepository.saveToken(token.token);
      LocalStorageRepository.saveRefreshToken(token.refreshToken);

      final String ttl = DateTime.now().add(Duration(hours: 1)).toString();

      LocalStorageRepository.saveTtl(ttl);
      LocalStorageRepository.saveUserEmail(user.email);

      yield AddTokenAction(token: token);
      RouteService.routes.removeLast();

      final List<FirstUserEntrance> users = await LocalStorageRepository.getUserEntrances();
      final bool isUserEntrance = LocalStorageRepository.getIsUserEntrance(users, user.email);

      if (isUserEntrance == false) {
        yield NavigateToAction.replace(Routes.kOnboarding);
      } else {
        yield NavigateToAction.replace(Routes.kHomePage);
      }
      yield GetFavoritesServerAction();
    });
  }

  static Stream<dynamic> logOutEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<LogOutAction>().switchMap((action) async* {
      yield RemoveTokenAction();
      await NotificationsService.messaging
          .setAutoInitEnabled(false)
          .then((value) => NotificationsService.messaging.deleteInstanceID());
      SessionService.token = EMPTY_STRING;
      LocalStorageRepository.deleteToken();
      await HttpService.logOut();
    });
  }

  static Stream<dynamic> recoverEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<RecoverAction>().switchMap((action) async* {
      final Response response = await HttpService.recover(email: action.email);
      if (response.statusCode == 200) {
        yield ChangeIsRecoverEmailErrorAction(isEmailError: false);
        DialogService.instance.close();
        await Future.delayed(Duration(milliseconds: 200));
        DialogService.instance.show(ForgotPasswordCodeDialog(email: action.email));
      } else {
        yield ChangeIsRecoverEmailErrorAction(isEmailError: true);
      }
    });
  }

  static Stream<dynamic> acceptCodeEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<AcceptCodeAction>().switchMap((action) async* {
      final Response response = await HttpService.acceptCode(
        email: action.email,
        code: action.code,
      );
      if (response.statusCode == 200) {
        yield ChangeIsCodeErrorAction(isCodeError: false);
        DialogService.instance.close();
        await Future.delayed(Duration(milliseconds: 200));
        DialogService.instance.show(ForgotPasswordDialog(email: action.email));
      } else {
        yield ChangeIsCodeErrorAction(isCodeError: true);
      }
    });
  }

  static Stream<dynamic> changePasswordEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<ChangePasswordAction>().switchMap((action) async* {
      final Response response = await HttpService.changePassword(
        email: action.email,
        password: action.password,
      );
      if (response.statusCode == 200) {
        DialogService.instance.close();
        yield SignInAction(
            user: User(
              firstName: APP_NAME,
              email: action.email,
              password: action.password,
            ));
        await NotificationsService.messaging.setAutoInitEnabled(true);
        yield NavigateToAction(Routes.kHomePage);
        yield ChangeNavigationBottomBarByNameAction(route: Routes.kHomePage);
      } else {}
    });
  }

  static Stream<dynamic> signInGoogleEpic(Stream<dynamic> actions, EpicStore<AppState> store) {
    return actions.whereType<SignInGoogleAction>().switchMap((action) async* {
      DialogService.instance.show(MainLoaderDialog());

      bool isRegisterGoogle = false;

      await Firebase.initializeApp();
      final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();

      final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn().catchError((e) {
        DialogService.instance.close();
        Future.delayed(Duration(milliseconds: 200));
        DialogService.instance.show(ErrorDialog());
      });

      try {
        final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;

        final firebase_auth.AuthCredential credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final firebase_auth.UserCredential userCredential = await _auth.signInWithCredential(credential);

        final firebase_auth.User firebaseUser = userCredential.user;

        assert(!firebaseUser.isAnonymous);
        assert(await firebaseUser.getIdToken() != null);

        final firebase_auth.User currentUser = _auth.currentUser;
        assert(firebaseUser.uid == currentUser.uid);

        Response response = await HttpService.signInGoogle(
          email: firebaseUser.email,
          googleToken: firebaseUser.uid,
        );

        if (response.body == 'Email or token entered incorrectly!') {
          isRegisterGoogle = true;

          response = await HttpService.registerGoogle(
            email: firebaseUser.email,
            googleToken: firebaseUser.uid,
          );
        }
        // TODO: json decode and from DTO should be in adapter. Don't do it in Epics
        // TODO epic > repositry > adapter > request

        final jsonData = json.decode(response.body);

        final Token token = Token.fromDTO(TokenDTO.fromJson(jsonData));

        LocalStorageRepository.saveToken(token.token);

        LocalStorageRepository.saveRefreshToken(token.refreshToken);
        LocalStorageRepository.saveUserEmail(firebaseUser.email);

        final String ttl = DateTime.now().add(Duration(hours: 1)).toString();

        LocalStorageRepository.saveTtl(ttl);

        yield AddTokenAction(token: token);
        RouteService.routes.removeLast();

        await NotificationsService.messaging.setAutoInitEnabled(true);

        final List<FirstUserEntrance> users = await LocalStorageRepository.getUserEntrances();

        final bool isUserEntrance = LocalStorageRepository.getIsUserEntrance(users, firebaseUser.email);

        DialogService.instance.close();

        if (isUserEntrance == false && isRegisterGoogle) {
          yield NavigateToAction.replace(Routes.kOnboarding);
        } else {
          yield NavigateToAction.replace(Routes.kHomePage);
          yield ChangeNavigationBottomBarByNameAction(route: Routes.kHomePage);
        }

        yield GetFavoritesServerAction();
      }
      catch (e) {
        DialogService.instance.close();
        await Future.delayed(Duration(milliseconds: 200));
        DialogService.instance.show(ErrorDialog());
      }
    });
  }
*/

}
