class TobaccoModel {
  final String? dateSubmitted;
  final List<String>? reportedHealthProblems;
  final List<String>? reportedProductProblems;
  final List<String>? tobaccoProducts;

  TobaccoModel({
    this.dateSubmitted,
    this.reportedHealthProblems,
    this.reportedProductProblems,
    this.tobaccoProducts,
  });

  factory TobaccoModel.fromJson(Map<String, dynamic> json) {
    return TobaccoModel(
      dateSubmitted: json['date_submitted'] as String?,
      reportedHealthProblems: (json['reported_health_problems'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      reportedProductProblems: (json['reported_product_problems'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
      tobaccoProducts: (json['tobacco_products'] as List<dynamic>?)
          ?.map((e) => e.toString())
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date_submitted': dateSubmitted,
      'reported_health_problems': reportedHealthProblems,
      'reported_product_problems': reportedProductProblems,
      'tobacco_products': tobaccoProducts,
    };
  }
}
