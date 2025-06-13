import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MaeRShadowStyle {
  static final verticalItemShadowBlack = BoxShadow(
    color: ColorConstants.colorBlack.withValues(alpha: 0.25),
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2),
  );

  static final horizontalItemShadowBlack = BoxShadow(
    color: ColorConstants.colorBlack.withValues(alpha: 0.25),
    blurRadius: 5,
    spreadRadius: 0,
    offset: Offset(0, 0),
  );

  static final verticalItemShadowWhite = BoxShadow(
    color: ColorConstants.colorWhite,
    blurRadius: 50,
    spreadRadius: 7,
    offset: Offset(0, 2),
  );

  static final horizontalItemShadowWhite = BoxShadow(
    color: ColorConstants.colorWhite,
    blurRadius: 5,
    spreadRadius: 0,
    offset: Offset(0, 0),
  );
}
