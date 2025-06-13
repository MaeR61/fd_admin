import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class MaeRChipTheme {
  MaeRChipTheme._();

  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: ColorConstants.colorSecondary,
    labelStyle: TextStyle(color: ColorConstants.colorBlack),
    selectedColor: ColorConstants.colorSecondary,
    padding: PaddingConstants.instance.paddingAllOnIki,
    checkmarkColor: ColorConstants.colorWhite,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    disabledColor: ColorConstants.colorSecondary,
    labelStyle: TextStyle(color: ColorConstants.colorWhite),
    selectedColor: ColorConstants.colorSecondary,
    padding: PaddingConstants.instance.paddingAllOnIki,
    checkmarkColor: ColorConstants.colorWhite,
  );
}
