import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class MaeRDivider extends StatelessWidget {
  const MaeRDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: ColorConstants.colorPrimary,
            thickness: 2,
            indent: context.dynamicWidth(0.1),
            endIndent: context.dynamicWidth(0.025),
            height: context.dynamicHeight(0.075),
          ),
        ),
        Text(
          dividerText,
          style: FontStyles.w5s12.copyWith(color: ColorConstants.colorPrimary),
        ),
        Flexible(
          child: Divider(
            color: ColorConstants.colorPrimary,
            thickness: 2,
            indent: context.dynamicWidth(0.025),
            endIndent: context.dynamicWidth(0.1),
            height: context.dynamicHeight(0.075),
          ),
        ),
      ],
    );
  }
}
