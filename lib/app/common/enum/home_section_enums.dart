import 'package:fd_admin/app/common/constants/string_constants.dart';

enum HomeSectionEnums {
  featured(title: Stringler.featured),
  products(title: Stringler.products),
  topics(title: Stringler.topics);

  final String title;
  const HomeSectionEnums({required this.title});
}
