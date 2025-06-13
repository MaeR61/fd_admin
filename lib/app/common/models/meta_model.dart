import 'package:fd_admin/app/common/enum/category_enums.dart';

class MetaTotal {
  final int? total;
  final CategoryEnum? category;

  MetaTotal({this.total, this.category});

  factory MetaTotal.fromJson(
    Map<String, dynamic> json, {
    CategoryEnum? category,
  }) {
    return MetaTotal(
      total: json["meta"]?["results"]?["total"],
      category: category, //Elle veriyorum
    );
  }
}
