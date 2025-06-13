import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/theme/styles/shadow_styles.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class MaeRHorizontalCard extends StatefulWidget {
  const MaeRHorizontalCard({
    super.key,
    this.child,
    this.expansionChild,
    this.width = 100,
    this.height,
    this.radius = 10,
    this.padding,
    this.margin,
    this.darkmodeBGColor = ColorConstants.colorTextPrimary,
    this.lightmodeBGColor = ColorConstants.colorWhiteLike,
  });

  final double? width, height;
  final double radius;
  final EdgeInsets? margin, padding;
  final Widget? child;
  final Widget? expansionChild;
  final Color darkmodeBGColor, lightmodeBGColor;

  @override
  State<MaeRHorizontalCard> createState() => _MaeRHorizontalCardState();
}

class _MaeRHorizontalCardState extends State<MaeRHorizontalCard>
    with TickerProviderStateMixin {
  bool _isExpansied = false;

  @override
  Widget build(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;

    return AnimatedContainer(
      duration: Durations.medium2,
      curve: Curves.ease,
      width: widget.width,
      height: widget.expansionChild != null ? widget.height : null,
      margin: widget.margin,
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.radius),
        // border: Border.all(color: ColorConstants.colorCarolineBlue, width: 0.5),
        boxShadow: [
          MaeRShadowStyle.horizontalItemShadowBlack.copyWith(
            offset: Offset(0, 1),
          ),
        ],
        color: dark ? widget.darkmodeBGColor : widget.lightmodeBGColor,
      ),
      child: AnimatedSize(
        duration: Durations.medium2,
        alignment: Alignment.topCenter,
        curve: Curves.ease,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (widget.child != null) Expanded(child: widget.child!),
                if (widget.expansionChild != null)
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isExpansied = !_isExpansied;
                      });
                    },
                    icon: Icon(
                      _isExpansied
                          ? Icons.arrow_drop_up_rounded
                          : Icons.arrow_drop_down_rounded,
                      color: ColorConstants.colorCarolineBlue,
                    ),
                  ),
              ],
            ),
            if (_isExpansied) ...[
              DikeyBosluk(height: 0.01),
              ?widget.expansionChild,
            ],
          ],
        ),
      ),
    );
  }
}
