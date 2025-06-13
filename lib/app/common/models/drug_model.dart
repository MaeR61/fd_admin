class DrugModel {
  final String? productNdc;
  final String? genericName;
  final String? labelerName;
  final String? brandName; //
  final bool finished; //
  final String? listingExpirationDate;
  final OpenFda? openFda; //
  final String? marketingCategory;
  final String? dosageForm; //
  final String? productType; //
  final String? marketingStartDate; //

  DrugModel({
    required this.productNdc,
    required this.genericName,
    required this.labelerName,
    required this.brandName,
    required this.finished,
    required this.listingExpirationDate,
    required this.openFda,
    required this.marketingCategory,
    required this.dosageForm,
    required this.productType,
    required this.marketingStartDate,
  });

  factory DrugModel.fromJson(Map<String, dynamic> json) {
    return DrugModel(
      productNdc: json['product_ndc'],
      genericName: json['generic_name'],
      labelerName: json['labeler_name'],
      brandName: json['brand_name'],

      finished: json['finished'] ?? false,

      listingExpirationDate: json['listing_expiration_date'],
      openFda: json['openfda'] != null && json['openfda'] is Map
          ? OpenFda.fromJson(json['openfda'])
          : null,
      marketingCategory: json['marketing_category'],
      dosageForm: json['dosage_form'],
      productType: json['product_type'],
      marketingStartDate: json['marketing_start_date'],
    );
  }
}

class OpenFda {
  final List<String> manufacturerName;
  final List<String> rxcui;
  final List<String> splSetId;
  final List<String> unii;

  OpenFda({
    required this.manufacturerName,
    required this.rxcui,
    required this.splSetId,
    required this.unii,
  });

  factory OpenFda.fromJson(Map<String, dynamic> json) {
    return OpenFda(
      manufacturerName:
          (json['manufacturer_name'] as List?)?.whereType<String>().toList() ??
          [],
      rxcui: (json['rxcui'] as List?)?.whereType<String>().toList() ?? [],
      splSetId:
          (json['spl_set_id'] as List?)?.whereType<String>().toList() ?? [],
      unii: (json['unii'] as List?)?.whereType<String>().toList() ?? [],
    );
  }
}
