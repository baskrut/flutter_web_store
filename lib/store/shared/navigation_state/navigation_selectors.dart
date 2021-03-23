import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:redux/redux.dart';
import 'package:web_store/res/routes.dart';
import 'package:web_store/services/route_service/route_service.dart';
import 'package:web_store/store/app_state/app_state.dart';
import 'package:web_store/store/shared/navigation_state/navigation_actions.dart';

// import 'package:base_project_template/res/const.dart';
// import 'package:base_project_template/res/routes.dart';
// import 'package:base_project_template/services/route_service/route_service.dart';
// import 'package:base_project_template/store/application/app_state.dart';
// import 'package:base_project_template/store/shared/navigation_state/navigation_actions.dart';


class NavigationSelector {
  static const String tag = '[NavigationSelector]';

  //properties
  // static int navigationBottomBarIndex(Store<AppState> store) {
  //   return store.state.navigationState.navigationBottomBarIndex;
  // }
  //
  // static bool getBottomBarVisibility(Store<AppState> store) {
  //   return store.state.navigationState.isBottomBarVisible;
  // }

  //functions
  static void Function() switchBottomBarVisibility(Store<AppState> store) {
    return () => store.dispatch(SwitchBottomBarVisibility());
  }

  static void Function(int index) changeNavigationBottomBarIndex(Store<AppState> store) {
    return (index) => store.dispatch(ChangeNavigationBottomBarIndexAction(index: index));
  }

  static void Function(String route) push(Store<AppState> store) {
    return (String route) {
      if (route == Routes.kAuthPage) {
        RouteService.routes = [];
        store.dispatch(NavigateToAction.pushNamedAndRemoveUntil(route, (route) => false));
      } else if (RouteService.routes.contains(route)) {
        store.dispatch(NavigateToAction.popUntil(predicate: ModalRoute.withName(route)));
        for (int i = RouteService.routes.length - 1; i >= 0; i--) {
          if (RouteService.routes.last == route) {
            break;
          }
          RouteService.routes.removeLast();
        }
      } else {
        store.dispatch(NavigateToAction.push(route));
      }
      store.dispatch(ChangeNavigationBottomBarByNameAction(route: route));

      // logger.d('$tag => push => ${RouteService.routes.join()}');
    };
  }

  static void Function(String route, Object params) pushWithParams(Store<AppState> store) {
    return (String route, Object params) {
      store.dispatch(ChangeNavigationBottomBarByNameAction(route: route));
      return store.dispatch(NavigateToAction.push(route, arguments: params));
    };
  }

  static void Function(String route, Object params) replace(Store<AppState> store) {
    return (String route, Object params) {
      RouteService.routes.removeLast();
      store.dispatch(NavigateToAction.replace(route, arguments: params));
      store.dispatch(ChangeNavigationBottomBarByNameAction(route: route));
      // logger.d('$tag => replace => ${RouteService.routes.join()}');
    };
  }

  static void Function() pop(Store<AppState> store) {
    return () {
      RouteService.routes.removeLast();
      store.dispatch(NavigateToAction.pop());
      store.dispatch(ChangeNavigationBottomBarByNameAction(route: RouteService.routes.last));
      // logger.d('$tag => pop => ${RouteService.routes.join()}');
    };
  }
}