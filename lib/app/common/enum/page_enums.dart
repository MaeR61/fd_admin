import 'package:flutter/material.dart';

enum PageEnums {
  page0("Home", Icons.home),
  page1("Search", Icons.search),
  page2("Categories", Icons.category_outlined),
  page3("Animal & Veterinary", Icons.pets),
  page4("Drugs", Icons.medical_services),
  page5("Devices", Icons.devices),
  page6("Foods", Icons.fastfood),
  page7("Tobacco", Icons.smoking_rooms),
  page8("Others", Icons.more_horiz);

  const PageEnums(this.label, this.icon);

  final String label;
  final IconData icon;
}
