class FoodModel {
  final List<String> outcomes;
  final String dateCreated;
  final List<String> reactions;
  final String dateStarted;
  final List<ProductInfo> products;

  FoodModel({
    required this.outcomes,
    required this.dateCreated,
    required this.reactions,
    required this.dateStarted,
    required this.products,
  });

  factory FoodModel.fromJson(Map<String, dynamic> json) {
    return FoodModel(
      outcomes: List<String>.from(json['outcomes'] ?? []),
      dateCreated: json['date_created'] ?? '',
      reactions: List<String>.from(json['reactions'] ?? []),
      dateStarted: json['date_started'] ?? '',
      products: (json['products'] as List<dynamic>? ?? [])
          .map((e) => ProductInfo.fromJson(e))
          .toList(),
    );
  }
}

class ProductInfo {
  final String role;
  final String nameBrand;

  ProductInfo({required this.role, required this.nameBrand});

  factory ProductInfo.fromJson(Map<String, dynamic> json) {
    return ProductInfo(
      role: json['role'] ?? '',
      nameBrand: json['name_brand'] ?? '',
    );
  }
}
