import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class YatayBosluk extends StatelessWidget {
  final double width;
  const YatayBosluk({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: context.dynamicWidth(width),);
  }
}