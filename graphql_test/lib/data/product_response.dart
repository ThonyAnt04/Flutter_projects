import 'package:graphql_test/data/product_detail_response.dart';

class ProductResponse {
  final List<ProductDetailResponse> result;

  ProductResponse({ required this.result});

  factory ProductResponse.fromJson(Map<String, dynamic> json){
    final items = json["products"]?["items"] as List<dynamic>? ?? [];
    final products = items.map((p) => ProductDetailResponse.fromJson(p)).toList();
    return ProductResponse(result: products);
  }
}