import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MaeRTextSelectionTheme {
  MaeRTextSelectionTheme._();

  static final lightTextSelectionTheme = TextSelectionTheme(
    data: TextSelectionThemeData(
      cursorColor: ColorConstants.colorPrimary,
      selectionColor: ColorConstants.colorPrimary,
      selectionHandleColor: ColorConstants.colorPrimary,
    ),
    child: Text(""),
  );

  static final darkTextSelectionTheme = TextSelectionTheme(
    data: TextSelectionThemeData(
      cursorColor: ColorConstants.colorPrimary,
      selectionColor: ColorConstants.colorPrimary,
      selectionHandleColor: ColorConstants.colorPrimary,
    ),
    child: Text(""),
  );
}
