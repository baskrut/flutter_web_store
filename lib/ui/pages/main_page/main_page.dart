import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:web_store/ui/layouts/main_layout.dart';
import 'package:web_store/ui/pages/main_page/main_page_vm.dart';
import 'package:web_store/ui/pages/main_page/widgets/categories_widget.dart';
import 'package:web_store/ui/pages/main_page/widgets/filter_widget.dart';
import 'package:web_store/ui/pages/main_page/widgets/items_list_widget.dart';
import 'package:web_store/ui/pages/main_page/widgets/search_field_widget.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector(
      converter: (store) => MainPageVM.fromStore(store),
      builder: (ctx, vm) {
        return MainLayout(
          //todo add main dictionary to vm
          child: Column(
            children: [
              // SearchFieldWidget(vm: vm,),
              Row(
                children: [
                  CategoriesWidget(),
                  FilterWidget(),
                ],
              ),
            ItemsListWidget(),
            ],
          ),
        );
      },
    );
  }
}
