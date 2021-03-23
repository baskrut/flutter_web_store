import 'package:flutter/material.dart';
import 'package:web_store/utils/base_action.dart';

class ChangeNavigationBottomBarIndexAction extends BaseAction {
  final int index;

  ChangeNavigationBottomBarIndexAction({@required this.index}) : super(type: 'ChangeNavigationBottomBarIndexAction');
}

class ChangeNavigationBottomBarByNameAction extends BaseAction {
  final String route;

  ChangeNavigationBottomBarByNameAction({@required this.route}) : super(type: 'ChangeNavigationBottomBarByNameAction');
}

class SwitchBottomBarVisibility extends BaseAction {
  SwitchBottomBarVisibility() : super(type: 'SwitchBottomBarVisibility');
}
