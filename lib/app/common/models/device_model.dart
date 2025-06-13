class DeviceModel {
  final String publicDeviceRecordKey;
  final String companyName;
  final String publishDate;
  final List<ProductCode> productCodes;

  DeviceModel({
    required this.publicDeviceRecordKey,
    required this.companyName,
    required this.publishDate,
    required this.productCodes,
  });

  factory DeviceModel.fromJson(Map<String, dynamic> json) {
    return DeviceModel(
      publicDeviceRecordKey: json['public_device_record_key'] ?? '',
      companyName: json['company_name'] ?? '',
      publishDate: json['publish_date'] ?? '',
      productCodes: (json['product_codes'] as List<dynamic>?)
              ?.map((e) => ProductCode.fromJson(e))
              .toList() ??
          [],
    );
  }

  /// Bu, ilk ürün için kolay erişim sağlar
  ProductCode? get primaryProductCode =>
      productCodes.isNotEmpty ? productCodes.first : null;
}

class ProductCode {
  final String code;
  final String name;
  final String? deviceName;
  final String? medicalSpecialtyDescription;

  ProductCode({
    required this.code,
    required this.name,
    this.deviceName,
    this.medicalSpecialtyDescription,
  });

  factory ProductCode.fromJson(Map<String, dynamic> json) {
    final openfda = json['openfda'] as Map<String, dynamic>? ?? {};
    return ProductCode(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      deviceName: openfda['device_name'],
      medicalSpecialtyDescription: openfda['medical_specialty_description'],
    );
  }
}
