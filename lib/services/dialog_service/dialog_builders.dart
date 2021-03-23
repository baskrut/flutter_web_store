import 'package:flutter/material.dart';

// todo add dialog service to app store

class DialogBuilders {
  static Future<void> defaultDialogBuilder({BuildContext context, Widget widget}) {
    return showDialog(
      context: context,
      builder: (BuildContext ctx) => widget,
    );
  }

  static Future<void> darkDialogBuilder({BuildContext context, Widget widget}) {
    return showDialog(
      context: context,
      builder: (BuildContext ctx) => widget,
      barrierColor: Colors.black54
    );
  }

  static Future<void> irremovableDialogBuilder({BuildContext context, Widget widget}) {
    return showDialog(
      context: context,
      builder: (BuildContext ctx) => widget,
      barrierDismissible: false,
    );
  }

  static Future<void> transparentBackgroundDialog({BuildContext context, Widget widget}) {
    return showDialog(
      context: context,
      builder: (BuildContext ctx) => widget,
      barrierColor: Colors.transparent,
    );
  }

  static Future<void> modalBottomSheetBuilder({BuildContext context, Widget widget}) {
    return showModalBottomSheet<dynamic>(
      context: context,
      elevation: 0.0,
      clipBehavior: Clip.hardEdge,
      builder: (BuildContext ctx) => widget,
    );
  }
}
