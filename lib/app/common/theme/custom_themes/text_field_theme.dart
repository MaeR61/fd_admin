import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MaeRTextFormFieldTheme {
  MaeRTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ColorConstants.colorSecondary,
    suffixIconColor: ColorConstants.colorSecondary,
    labelStyle: TextStyle(color: ColorConstants.colorBlack),
    hintStyle: TextStyle(color: ColorConstants.colorSecondary),
    errorStyle: TextStyle(color: ColorConstants.colorRed),
    floatingLabelStyle: TextStyle(
      color: ColorConstants.colorBlack.withValues(alpha: 0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: ColorConstants.colorPrimary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: ColorConstants.colorPrimary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: ColorConstants.colorPrimary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: ColorConstants.colorRed),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: ColorConstants.colorPrimary),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: ColorConstants.colorSecondary,
    suffixIconColor: ColorConstants.colorSecondary,
    labelStyle: TextStyle(color: ColorConstants.colorWhite),
    hintStyle: TextStyle(color: ColorConstants.colorWhite),
    errorStyle: TextStyle(color: ColorConstants.colorRed),
    floatingLabelStyle: TextStyle(
      color: ColorConstants.colorWhite.withValues(alpha: 0.8),
    ),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: ColorConstants.colorPrimary),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: ColorConstants.colorPrimary),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: ColorConstants.colorPrimary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: ColorConstants.colorRed),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(width: 1, color: ColorConstants.colorPrimary),
    ),
  );
}
