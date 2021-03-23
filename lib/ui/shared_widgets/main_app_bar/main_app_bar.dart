import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;

  MainAppBar({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      elevation: 2.0,
      shadowColor: Color(0xFFCFDCE5),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(88.0);
}
