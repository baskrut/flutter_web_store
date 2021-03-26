import 'package:web_store/adapters/product_adapter.dart';
import 'package:web_store/models/models/product.dart';

class ProductRepository{
  static Future<List<Product>> getProducts() async =>
      await ProductAdapter.getProducts();
}