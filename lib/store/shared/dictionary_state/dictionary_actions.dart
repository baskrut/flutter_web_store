import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_store/utils/base_action.dart';

class ChangeLanguageAction extends BaseAction {
  final String code;

  ChangeLanguageAction({
    @required this.code,
  });
}

class ChangeLanguageEpicAction extends BaseAction {
  final String code;

  ChangeLanguageEpicAction({
    @required this.code,
  });
}

class SetNeedsRequestFromTypeAction extends BaseAction {
  final Type page;

  SetNeedsRequestFromTypeAction({
    @required this.page,
  });
}

class UnSetNeedsRequestFromTypeAction extends BaseAction {
  final Type page;

  UnSetNeedsRequestFromTypeAction({
    @required this.page,
  });
}
