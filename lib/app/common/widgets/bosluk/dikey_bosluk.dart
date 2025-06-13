import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class DikeyBosluk extends StatelessWidget {
  final double height;
  const DikeyBosluk({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.dynamicHeight(height),);
  }
}