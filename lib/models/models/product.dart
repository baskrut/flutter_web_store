import 'package:flutter/material.dart';
import 'package:web_store/models/dtos/product_dto.dart';

class Product {
  final String id;
  final String brand;
  final String name;
  final String price;
  final String mainImageUrl;

  // final List<String> imagesUrl;
  final String category;
  final String productType;
  final String description;

  // final Map<String, Color> productColors;

  Product({
    this.id,
    this.brand,
    this.name,
    this.price,
    this.mainImageUrl,
    // this.imagesUrl,
    this.category,
    this.description,
    // this.productColors,
    this.productType,
  });

  static Product fromDTO(ProductDTO dto) {
    return Product(
      id: dto.id,
      brand: dto.brand,
      name: dto.name,
      price: dto.price,
      description: dto.description,
      category: dto.category,
      mainImageUrl: dto.mainImageUrl,
      productType: dto.productType,
      // productColors: Map<String, Color>.from(json['product_colors'])
    );
  }
}
