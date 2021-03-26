import 'dart:convert';

import 'package:web_store/models/dtos/product_dto.dart';
import 'package:web_store/models/models/product.dart';
import 'package:http/http.dart';
import 'package:web_store/services/http_service/http_service.dart';

class ProductAdapter {
  static Future<List<Product>> getProducts() async {
    final Response response = await HttpService.getFoundProducts();
    final List<Product> foundProducts = [];
    if (response.statusCode == 200) {
      List jsonDataList = jsonDecode(response.body);
      for (int i = 0; i < jsonDataList.length; i++) {
        foundProducts.add(
          Product.fromDTO(
            ProductDTO.fromJson(jsonDataList[i]),
          ),
        );
      }
    }
    return foundProducts;
  }
}
