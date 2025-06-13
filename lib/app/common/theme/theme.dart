import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/theme/custom_themes/appbar_theme.dart';
import 'package:fd_admin/app/common/theme/custom_themes/bottom_sheet_theme.dart';
import 'package:fd_admin/app/common/theme/custom_themes/checkbox_theme.dart';
import 'package:fd_admin/app/common/theme/custom_themes/elevated_button_theme.dart';
import 'package:fd_admin/app/common/theme/custom_themes/outlined_button_theme.dart';
import 'package:fd_admin/app/common/theme/custom_themes/text_theme.dart';
import 'package:flutter/material.dart';

class MaeRAppTheme {
  MaeRAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    colorScheme: ColorScheme.light().copyWith(
      primary: ColorConstants.colorPrimary,
    ),
    primaryColor: ColorConstants.colorPrimary,
    scaffoldBackgroundColor: ColorConstants.colorWhite,
    textTheme: MaeRTextTheme.lightTextTheme,
    elevatedButtonTheme: MaeRElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: MaeRAppBarTheme.lightAppBarTheme,
    bottomSheetTheme: MaeRBottomSheetTheme.lightBottomSheetTheme,
    checkboxTheme: MaeRCheckboxTheme.lightCheckboxTheme,
    outlinedButtonTheme: MaeROutlinedButtonTheme.lightOutlinedButtonTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    colorScheme: ColorScheme.dark().copyWith(
      primary: ColorConstants.colorPrimary,
    ),
    primaryColor: ColorConstants.colorPrimary,
    scaffoldBackgroundColor: ColorConstants.colorBlack,
    textTheme: MaeRTextTheme.darkTextTheme,
    elevatedButtonTheme: MaeRElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: MaeRAppBarTheme.darkAppBarTheme,
    bottomSheetTheme: MaeRBottomSheetTheme.darkBottomSheetTheme,
    checkboxTheme: MaeRCheckboxTheme.darkCheckboxTheme,
    outlinedButtonTheme: MaeROutlinedButtonTheme.darkOutlinedButtonTheme,
  );
}
