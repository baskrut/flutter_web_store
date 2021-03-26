import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:web_store/models/models/product.dart';
import 'package:web_store/store/pages_state/main_page_state/main_page_actions.dart';
import 'package:web_store/store/reducer.dart';

class MainPageState {
  final List<Product> foundProducts;

  MainPageState({@required this.foundProducts});

  factory MainPageState.initial() {
    return MainPageState(foundProducts: []);
  }

  MainPageState copyWith({
    List<Product> foundProducts,
  }) {
    return MainPageState(
      foundProducts: foundProducts ?? this.foundProducts,
    );
  }

  MainPageState reducer(dynamic action){
    return Reducer<MainPageState>(actions: HashMap.from({
      // GetProductsAction: (dynamic action) =>
    })).updateState(action, this);
  }


}
