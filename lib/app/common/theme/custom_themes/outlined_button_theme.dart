import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/padding_constants.dart';
import 'package:flutter/material.dart';

class MaeROutlinedButtonTheme {
  MaeROutlinedButtonTheme._();

  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorConstants.colorBlack,
      side: BorderSide(color: ColorConstants.colorPrimary),
      padding: PaddingConstants.instance.paddingAllOnAlti,
      textStyle: TextStyle(color: ColorConstants.colorBlack),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );

  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: ColorConstants.colorWhite,
      side: BorderSide(color: ColorConstants.colorPrimary),
      padding: PaddingConstants.instance.paddingAllOnAlti,
      textStyle: TextStyle(color: ColorConstants.colorWhite),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
  );
}
