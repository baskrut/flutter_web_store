import 'package:flutter/material.dart';
import 'package:flutter_redux_navigation/flutter_redux_navigation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:web_store/res/routes.dart';
import 'file:///C:/Users/AppVesto/AndroidStudioProjects/web_store/lib/ui/pages/main_page/main_page.dart';

class RouteService {


  RouteService._privateConstructor();

  static final RouteService _instance = RouteService._privateConstructor();

  static RouteService get instance => _instance;
  static List<String> routes = [];

  static String get prevRoute => NavigatorHolder.state.previousDestination.path;

  static String get currentRoute => NavigatorHolder.state.currentDestination.path;

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    routes.add(settings.name);
    PageTransition transition;

    switch (settings.name) {
      case Routes.kMainPage:
        transition = PageTransition(
          child: MainPage(),
          type: PageTransitionType.fade,
          settings: settings,
        );
        break;
      /*case Routes.kSettingsPage:
        transition = PageTransition(
          child: SettingsPage(),
          type: PageTransitionType.fade,
          settings: settings,
        );
        break;*/

    /*  case Routes.kAuthPage:
        transition = PageTransition(
          child: AuthPage(),
          type: PageTransitionType.fade,
          settings: settings,
        );
        break;*/


      default:
        transition = _defaultRoute(
          settings: settings,
          page: MainPage(),
        );
        break;
    }
    return transition;
  }

  static PageTransition _defaultRoute({RouteSettings settings, Widget page}) {
    return PageTransition(
      type: PageTransitionType.fade,
      settings: settings,
      child: page,
    );
  }
}
