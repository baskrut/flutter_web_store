class ApiParams{

  static const String baseUrl = 'http://makeup-api.herokuapp.com/api/v1/products.json?';

  static const String productType = 'product_type=';
  static const String productCategory = 'product_category=';
  static const String productTags = 'product_tags=';
  static const String brand = 'brand='; // to get all products let query empty
  static const String priceGreater = 'price_greater_then=';
  static const String priceLess = 'price_less_then=';
  static const String ratingGreater = 'rating_greater_then=';
  static const String ratingLess = 'rating_less_then=';


  static const String GET = 'GET';
}