class ProductDetailResponse {
  final String id;
  final String name;
  final String url;
  final String stockStatus;
  final double price;
  final String currency;

  ProductDetailResponse({
    required this.id,
    required this.name,
    required this.url,
    required this.stockStatus,
    required this.price,
    required this.currency,
  });

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailResponse(
      id: json["id"].toString(),
      name: json["name"] ?? '',
      url: json["image"]?["url"] ?? '',
      stockStatus: json["stock_status"] ?? '',
      price: (json["price"]?["regularPrice"]?["amount"]?["value"] ?? 0).toDouble(),
      currency: json["price"]?["regularPrice"]?["amount"]?["currency"] ?? '',
    );
  }
}