import 'package:fd_admin/app/presentation/topics/international/view/international_view.dart';
import 'package:flutter/material.dart';
import 'package:fd_admin/app/common/constants/string_constants.dart';

abstract class InternationalViewModel extends State<InternationalView> {
  final List<String> steps = [
    Stringler.globalStep1,
    Stringler.globalStep2,
    Stringler.globalStep3,
    Stringler.globalStep4,
    Stringler.globalStep5,
    Stringler.globalStep6,
  ];
}
