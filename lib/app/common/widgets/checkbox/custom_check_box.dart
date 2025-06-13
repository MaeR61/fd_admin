import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  final void Function(bool value) onChange;
  final bool value;
  final double dimension;
  final EdgeInsets? margin, padding;

  const CustomCheckBox({
    super.key,
    required this.onChange,
    required this.value,
    this.margin,
    this.padding,
    required this.dimension,
  });

  @override
  Widget build(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () => onChange(!value),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: dark ? ColorConstants.colorWhite : ColorConstants.colorBlack,
          ),
          color: dark ? ColorConstants.colorBlack : ColorConstants.colorWhite,
        ),
        height: dimension,
        width: dimension,
        margin: margin,
        padding: padding,
        child: value
            ? Padding(
                padding: EdgeInsets.all(dimension * 0.001),
                child: FittedBox(
                  child: Icon(Icons.check, color: ColorConstants.colorPrimary),
                ),
              )
            : null,
      ),
    );
  }
}
