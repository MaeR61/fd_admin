import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum SvgEnums {
  fda("logo"),
  whiteLogo("fda-white"),
  logo("fda-themed");

  const SvgEnums(this.value);

  final String value;

  String get svgPath => "assets/images/logos/svg/$value.svg";
}

extension SvgEnumX on SvgEnums {
  SvgPicture svgWidget({double? height, width, Color? color}) =>
      SvgPicture.asset(
        svgPath,
        height: height,
        width: width,
        colorFilter: color != null
            ? ColorFilter.mode(color, BlendMode.srcIn)
            : null,
        fit: BoxFit.contain,
      );
}
