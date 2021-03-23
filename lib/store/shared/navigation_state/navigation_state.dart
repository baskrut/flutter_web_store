import 'dart:collection';
import 'package:web_store/res/routes.dart';
import 'package:web_store/store/reducer.dart';
import 'package:web_store/store/shared/navigation_state/navigation_actions.dart';

class NavigationState {  final int navigationBottomBarIndex;
final bool isBottomBarVisible;

NavigationState({
  this.navigationBottomBarIndex,
  this.isBottomBarVisible,
});

factory NavigationState.initial() {
  return NavigationState(
    navigationBottomBarIndex: 0,
    isBottomBarVisible: true,
  );
}

NavigationState copyWith({
  int navigationBottomBarIndex,
  bool isBottomBarVisible,
}) {
  return NavigationState(
    navigationBottomBarIndex: navigationBottomBarIndex ?? this.navigationBottomBarIndex,
    isBottomBarVisible: isBottomBarVisible ?? this.isBottomBarVisible,
  );
}

NavigationState reducer(dynamic action) {
  return Reducer<NavigationState>(
    actions: HashMap.from({
      SwitchBottomBarVisibility: (dynamic action) => switchBottomBarVisibility(),
      ChangeNavigationBottomBarIndexAction: (dynamic action) => changeNavigationBottomBarIndex(action.index),
      ChangeNavigationBottomBarByNameAction: (dynamic action) => changeNavigationBottomBarByName(action.route),
    }),
  ).updateState(action, this);
}


NavigationState changeNavigationBottomBarByName(String route) {
    switch (route) {
      case Routes.kMainPage:
        return copyWith(navigationBottomBarIndex: 0);
      case Routes.kCartPage:
        return copyWith(navigationBottomBarIndex: 1);
      case Routes.kSettingsPage:
        return copyWith(navigationBottomBarIndex: 2);
      default:
        return copyWith(navigationBottomBarIndex: -1);
    }
  }

  NavigationState changeNavigationBottomBarIndex(int index) {
    return copyWith(navigationBottomBarIndex: index);
  }

  NavigationState switchBottomBarVisibility() {
    return copyWith(isBottomBarVisible: !isBottomBarVisible);
  }
}
