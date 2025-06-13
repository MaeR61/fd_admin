import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MaeRCheckboxTheme {
  MaeRCheckboxTheme._();

  static CheckboxThemeData lightCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorConstants.colorWhite;
      } else {
        return ColorConstants.colorBlack;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorConstants.colorBlack;
      } else {
        return Colors.transparent;
      }
    }),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorConstants.colorPrimary.withValues(alpha: 0.2);
      } else {
        return ColorConstants.colorPrimary.withValues(alpha: 0.2);
      }
    }),
  );

  static CheckboxThemeData darkCheckboxTheme = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorConstants.colorWhite;
      } else {
        return ColorConstants.colorBlack;
      }
    }),
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorConstants.colorBlack;
      } else {
        return Colors.transparent;
      }
    }),
    overlayColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return ColorConstants.colorPrimary.withValues(alpha: 0.2);
      } else {
        return ColorConstants.colorPrimary.withValues(alpha: 0.2);
      }
    }),
  );
}
