import 'package:fd_admin/app/presentation/topics/training/view/training_view.dart';
import 'package:flutter/material.dart';

abstract class TrainigViewModel extends State<TrainingView> {
  final List<String> steps1 = [
    "Overview of FDA",
    "FDA 101",
    "FDA's Organization",
    "FDA's Regulatory Framework",
    "Current Initiatives",
  ];

  final List<String> steps2 = [
    "Human Drug Approval and Post-marketing",
    "Medical Device Approval and Post-marketing",
    "Radiation-emitting Products",
    "In Vitro Diagnostics",
    "Biologics (Blood, Vaccines, Cell, Tissue and Gene) Products",
    "Tobacco Products",
  ];

  final List<String> steps3 = [
    "Foods",
    "Cosmetics",
    "Dietary Supplements",
    "Infant Formulas",
    "Animal Drugs and Feed",
  ];

  final List<String> steps4 = ["FDA Research", "Other Training"];

  final List<String> steps5 = [
    "Center for Biologics Evaluation and Research",
    "Center for Devices and Radiological Health",
    "Center for Drug Evaluation and Research",
    "Human Foods Program",
    "Center for Tobacco Products",
    "National Center for Toxicological Research",
    "Office of the Commissioner",
    "Office of Inspections and Investigations",
  ];
}
