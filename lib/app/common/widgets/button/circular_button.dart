import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class MaeRButton extends StatelessWidget {
  final String icerik;
  final TextStyle font;
  final VoidCallback onTap;

  const MaeRButton({
    super.key,
    required this.icerik,
    required this.font,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        alignment: Alignment.center,
        width: context.dynamicWidth(0.8),
        height: context.dynamicHeight(0.070),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              ColorConstants.colorPrimary,
              ColorConstants.colorSecondary,
            ],
          ),
        ),
        child: Text(icerik, style: font),
      ),
    );
  }
}
