import 'package:flutter/material.dart';

enum BnbEnums {
  btnHome("Search", Icons.home_outlined),
  btnSearch("Home", Icons.search),
  btnCategory("Categories", Icons.category_outlined);

  const BnbEnums(this.label, this.icon);

  final String label;
  final IconData icon;
}
