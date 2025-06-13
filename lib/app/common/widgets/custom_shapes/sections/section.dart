import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.sectionTitle,
    required this.action,
    this.child,
  });

  factory Section.titleWithButton({
    required BuildContext context,
    required String sectionTitle,
    Widget? child,
  }) {
    return Section(
      sectionTitle: sectionTitle,
      action: GestureDetector(
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: Icon(
            Icons.arrow_right,
            size: 20,
            color: ColorConstants.colorPrimary,
          ),
        ),
      ),
      child: child,
    );
  }

  factory Section.titleAndChild({
    required BuildContext context,
    required String sectionTitle,
    Widget? child,
  }) {
    return Section(sectionTitle: sectionTitle, action: null, child: child);
  }

  factory Section.justTitle({
    required BuildContext context,
    required String sectionTitle,
  }) {
    return Section(sectionTitle: sectionTitle, action: null);
  }

  final String sectionTitle;
  final Widget? action, child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.9),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                sectionTitle,
                style: FontStyles.w7s14.copyWith(
                  color: ColorConstants.colorPrimary,
                ),
              ),
              Spacer(),
              if (action != null) action!,
            ],
          ),

          if (child != null)
            Column(
              children: [
                DikeyBosluk(height: 0.02),
                child!,
                DikeyBosluk(height: 0.05),
              ],
            ),
        ],
      ),
    );
  }
}
