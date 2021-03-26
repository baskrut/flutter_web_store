import 'package:flutter/material.dart';
import 'package:web_store/ui/shared_widgets/main_app_bar/main_app_bar.dart';

class MainLayout extends StatelessWidget {
  final Widget child;
  final String appBarTitle;

  MainLayout({
    this.child,
    this.appBarTitle = ' ',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: appBarTitle,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: child,
      ),
      resizeToAvoidBottomInset: true,
    );
  }
}
