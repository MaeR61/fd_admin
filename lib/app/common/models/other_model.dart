class OtherModel {
  final String? proprietaryName;
  final String? marketingEndDate;
  final String? applicationNumberOrCitation;
  final String? productType;
  final String? marketingStartDate;
  final String? packageNdc;
  final String? marketingCategory;
  final String? packageNdc11;
  final String? dosageForm;

  OtherModel({
    this.proprietaryName,
    this.marketingEndDate,
    this.applicationNumberOrCitation,
    this.productType,
    this.marketingStartDate,
    this.packageNdc,
    this.marketingCategory,
    this.packageNdc11,
    this.dosageForm,
  });

  factory OtherModel.fromJson(Map<String, dynamic> json) {
    return OtherModel(
      proprietaryName: json['proprietary_name'],
      marketingEndDate: json['marketing_end_date'],
      applicationNumberOrCitation: json['application_number_or_citation'],
      productType: json['product_type'],
      marketingStartDate: json['marketing_start_date'],
      packageNdc: json['package_ndc'],
      marketingCategory: json['marketing_category'],
      packageNdc11: json['package_ndc11'],
      dosageForm: json['dosage_form'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'proprietary_name': proprietaryName,
      'marketing_end_date': marketingEndDate,
      'application_number_or_citation': applicationNumberOrCitation,
      'product_type': productType,
      'marketing_start_date': marketingStartDate,
      'package_ndc': packageNdc,
      'marketing_category': marketingCategory,
      'package_ndc11': packageNdc11,
      'dosage_form': dosageForm,
    };
  }
}
