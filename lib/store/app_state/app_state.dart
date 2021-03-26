
import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart' as redux;

import 'package:redux_epics/redux_epics.dart';
import 'package:web_store/store/pages_state/auth_page_state/auth_epics.dart';
import 'package:web_store/store/pages_state/auth_page_state/auth_state.dart';
import 'package:web_store/store/pages_state/main_page_state/main_page_epics.dart';
import 'package:web_store/store/pages_state/main_page_state/main_page_state.dart';
import 'package:web_store/store/shared/dictionary_state/dictionary_state.dart';
import 'package:web_store/store/shared/navigation_state/navigation_actions.dart';
import 'package:web_store/store/shared/navigation_state/navigation_state.dart';

class AppState {
  final AuthState authState;


  final NavigationState navigationState;

  final DictionaryState dictionaryState;

  final MainPageState mainPageState;


  // final SplashScreenState splashScreenState;
  // final NotificationState notificationState;


/*  static const List<Type> blackList = [
    redux.NavigateToAction,
    ChangeNavigationBottomBarByNameAction,
  ];*/

  AppState({
    @required this.authState,
    @required this.dictionaryState,
    @required this.navigationState,
    @required this.mainPageState,
  /*@required this.favoritesState,

    @required this.onBoardingState,

    @required this.ingredientsState,
    @required this.foundRecipesState,
    @required this.splashScreenState,
    @required this.notificationState,
    @required this.swipeTutorialState,*/
  });

  ///All states are initialized in the [initial] function.
  factory AppState.initial() {
    return AppState(
      authState: AuthState.initial(),
      dictionaryState: DictionaryState.initial(),
      navigationState: NavigationState.initial(),
      mainPageState: MainPageState.initial(),
      /*favoritesState: FavoritesState.initial(),


      onBoardingState: OnBoardingState.initial(),
      ingredientsState: IngredientsState.initial(),
      foundRecipesState: FoundRecipesState.initial(),
      splashScreenState: SplashScreenState.initial(),
      notificationState: NotificationState.initial(),
      swipeTutorialState: SwipeTutorialState.initial(),*/
    );
  }

  ///The [getReducer] function is the main Reducer in which you call Reducer, all other states.
  static AppState getReducer(AppState state, dynamic action) {
    const String TAG = '[appReducer]';
/*
    if(!blackList.contains(action.runtimeType)){
      logger.d('$TAG => action: ${action.runtimeType}');
    }
    if(action is LogOutAction){
      return AppState(
        authState: AuthState.initial(),
        favoritesState: FavoritesState.initial(),
        navigationState: NavigationState.initial(),
        dictionaryState: state.dictionaryState,
        onBoardingState: OnBoardingState.initial(),
        ingredientsState: IngredientsState.initial(),
        foundRecipesState: FoundRecipesState.initial(),
        splashScreenState: SplashScreenState.initial(),
        notificationState: NotificationState.initial(),
        swipeTutorialState: SwipeTutorialState.initial(),
      );
    }
*/    return AppState(
      authState: state.authState.reducer(action),
      dictionaryState: state.dictionaryState.reducer(action),
      navigationState: state.navigationState.reducer(action),
      mainPageState: state.mainPageState.reducer(action),
      // navigationState: state.navigationState.reducer(action),
      // loaderState: state.loaderState.reducer(action),
      // favoritesState: state.favoritesState.reducer(action),
      //
      //
      // onBoardingState: state.onBoardingState.reducer(action),
      // ingredientsState: state.ingredientsState.reducer(action),
      // foundRecipesState: state.foundRecipesState.reducer(action),
      // splashScreenState: state.splashScreenState.reducer(action),
      // notificationState: state.notificationState.reducer(action),
      // swipeTutorialState: state.swipeTutorialState.reducer(action),
    );
  }

  ///In [getAppEpic], call the main epic.
  static final getAppEpic = combineEpics<AppState>([
    AuthStateEpics.indexEpic,
    MainPageEpics.indexEpic,
    // OnBoardingPageStateEpics.indexEpic,
    // SplashScreenStateEpics.indexEpic,
    // InitializeStateEpics.indexEpic,
    // IngridientsEpics.indexEpic,
    // SwipeTutorialEpics.indexEpic,
    // FoundRecipesEpics.indexEpic,
    // FavoritesEpics.indexEpic,
    // NotificationsEpics.indexEpic,
    // DictionaryEpics.indexEpic,
  ]);
}
