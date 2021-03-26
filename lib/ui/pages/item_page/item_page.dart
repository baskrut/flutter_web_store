
import 'package:flutter/material.dart';
import 'package:web_store/models/models/product.dart';
import 'package:web_store/ui/layouts/main_layout.dart';
import 'package:web_store/ui/shared_widgets/photo_slider.dart';

class ItemPage extends StatelessWidget {
  final Product item;
//todo вытягивать айтем из вью модель
  ItemPage({this.item});

  @override
  Widget build(BuildContext context) {
    return MainLayout(
        child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* Stack(
            children: [
             PhotoSlider(),
             Text(item.name),
            ],
          ),
          Text(item.price),
          Text(item.size),
          Text(item.description),*/
        ],
      ),
    ));
  }
}
