import 'dart:ui';

class ProductDTO {
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

  ProductDTO({
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

  factory ProductDTO.fromJson(Map<String, dynamic> json) {
    return ProductDTO(
      id: json['id'],
      brand: json['brand'],
      name: json['name'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      mainImageUrl: json['image_link'],
      productType: json['product_type'],
      // productColors: Map<String, Color>.from(json['product_colors'])
    );
  }

/*  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'brand': brand,
      'price': price,
      'description': description,
      'category': category,
      'image_link': mainImageUrl,
      'product_type': productType,
    };
  }*/
}

