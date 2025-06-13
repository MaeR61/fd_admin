import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class MaeRElevatedButtonTheme {
  MaeRElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorConstants.colorBlack,
      backgroundColor: ColorConstants.colorPrimary,
      disabledForegroundColor: ColorConstants.colorBlack,
      disabledBackgroundColor: ColorConstants.colorSecondary,
      side: BorderSide(color: ColorConstants.colorPrimary),
      padding: PaddingConstants.instance.paddingVerOnAlti,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorConstants.colorBlack,
      backgroundColor: ColorConstants.colorPrimary,
      disabledForegroundColor: ColorConstants.colorBlack,
      disabledBackgroundColor: ColorConstants.colorSecondary,
      side: BorderSide(color: ColorConstants.colorPrimary),
      padding: PaddingConstants.instance.paddingVerOnAlti,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );
}
