import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MaeRAppBarTheme {
  MaeRAppBarTheme._();

  static final lightAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: ColorConstants.colorBlack, size: 32),
    actionsIconTheme: IconThemeData(color: ColorConstants.colorBlack, size: 32),
    titleTextStyle: TextStyle(color: ColorConstants.colorBlack),
  );

  static final darkAppBarTheme = AppBarTheme(
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    iconTheme: IconThemeData(color: ColorConstants.colorWhite, size: 32),
    actionsIconTheme: IconThemeData(color: ColorConstants.colorWhite, size: 32),
    titleTextStyle: TextStyle(color: ColorConstants.colorWhite),
  );
}
