import 'dart:collection';

import 'package:web_store/store/reducer.dart';







class AuthState {
 /* final bool isSignIn;
  final bool isRecoverEmailError;
  final bool isCodeError;
  final bool obscureText;
  final Token token;
  final bool isAndroid;*/

  AuthState(/*{
    @required this.isSignIn,
    @required this.token,
    @required this.obscureText,
    @required this.isAndroid,
    @required this.isRecoverEmailError,
    @required this.isCodeError,
  }*/);

  factory AuthState.initial() {
    return AuthState(
/*      isSignIn: true,
      isCodeError: false,
      isRecoverEmailError: false,
      obscureText: true,
      token: Token(
        token: EMPTY_STRING,
        ttlToken: DateTime.now(),
        refreshToken: EMPTY_STRING,
      ),
      */
    );
  }

  AuthState copyWith(/*{
    bool isSignIn,
    bool obscureText,
    User user,
    Token token,
    bool isAndroid,
    bool isCodeError,
    bool isRecoverEmailError,
  }*/) {
    return AuthState(
    /*  isSignIn: isSignIn ?? this.isSignIn,
      obscureText: obscureText ?? this.obscureText,
      token: token ?? this.token,
      isAndroid: isAndroid ?? this.isAndroid,
      isCodeError: isCodeError ?? this.isCodeError,
      isRecoverEmailError: isRecoverEmailError ?? this.isRecoverEmailError,*/
    );
  }

  AuthState reducer(dynamic action) {
    return Reducer<AuthState>(
      actions: HashMap.from({
        /*ChangeAuthPageAction: (dynamic action) => _changeAuthPage(),
        AddTokenAction: (dynamic action) => _addToken(action.token),
        RemoveTokenAction: (dynamic action) => _removeToken(),
        ChangeIsRecoverEmailErrorAction: (dynamic action) => _changeIsRecoverEmailError(action.isEmailError),
        ChangeIsCodeErrorAction: (dynamic action) => _changeIsCodeError(action.isCodeError),*/
      }),
    ).updateState(action, this);
  }

/*AuthState _changeAuthPage() {
    return copyWith(isSignIn: !isSignIn);
  }

  AuthState _addToken(Token token) {
    SessionService.token = token.token;
    return copyWith(token: token);
  }

  AuthState _removeToken() {
    return copyWith( );
  }

  AuthState _changeIsRecoverEmailError(bool isEmailError) {
    return copyWith(isRecoverEmailError: isEmailError);
  }

  AuthState _changeIsCodeError(bool isCodeError) {
    return copyWith(isCodeError: isCodeError);
  }*/
}
