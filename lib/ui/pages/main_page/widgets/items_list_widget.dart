import 'package:flutter/material.dart';
import 'package:web_store/ui/pages/main_page/main_page_vm.dart';

class ItemsListWidget extends StatelessWidget {
  final MainPageVM vm;

  ItemsListWidget({this.vm});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: vm.findProducts.length,
        itemBuilder: (context, id) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(vm.findProducts[id].name),
      );
    });
  }
}
