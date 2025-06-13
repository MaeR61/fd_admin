import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:flutter/material.dart';

class MaeRCircularContainer extends StatelessWidget {
  const MaeRCircularContainer({
    super.key,
    this.child,
    this.width = 400,
    this.height = 400,
    this.radius = 400,
    this.padding,
    this.margin,
    this.backgroundColor = ColorConstants.colorWhite,
  });

  final double? width, height;
  final double radius;
  final EdgeInsets? margin, padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
