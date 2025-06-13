import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:flutter/material.dart';

enum CategoryEnum {
  categoryAll("All", Icons.category_rounded, ImagePaths.cows),
  categoryAnimal("Animal & Veterinary", Icons.pets, ImagePaths.ctgr1),
  categoryDrugs("Drugs", Icons.medical_services, ImagePaths.ctgr2),
  categoryDevices("Devices", Icons.devices, ImagePaths.ctgr3),
  categoryFoods("Foods", Icons.fastfood, ImagePaths.ctgr4),
  categoryTobacco("Tobacco", Icons.smoking_rooms, ImagePaths.ctgr6),
  categoryOthers("Others", Icons.more_horiz, ImagePaths.ctgr5);

  const CategoryEnum(this.label, this.icon, this.image);

  final String label;
  final String image;
  final IconData icon;
}
