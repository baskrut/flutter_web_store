import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:web_store/application/my_app.dart';
import 'package:web_store/store/app_state/app_state.dart';
import 'package:flutter/material.dart';
import 'package:web_store/ui/pages/main_page/main_page.dart';

void main() {
  Store store = Store<AppState>(
    AppState.getReducer,
    initialState: AppState.initial(),
    middleware: [
      EpicMiddleware(AppState.getAppEpic),
      NavigationMiddleware<AppState>(),
    ],
  );
  runApp(MyApp(
    store: store,
  ));
}
