import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/padding_constants.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    this.image,
    this.icon,
    required this.kategori,
    this.padding,
    this.textColor = ColorConstants.colorBlack,
    this.backgroundColor = ColorConstants.colorWhite,
    this.onTap,
    required this.index,
  });

  final String kategori;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final int index;
  final Image? image;
  final Icon? icon;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 64,
            height: 64,
            padding: padding ?? PaddingConstants.instance.paddingAllSekiz,
            decoration: BoxDecoration(
              color:
                  backgroundColor ??
                  (dark
                      ? ColorConstants.colorWhite
                      : ColorConstants.colorBlack),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(child: image ?? icon),
          ),
          DikeyBosluk(height: 0.005),
          SizedBox(
            width: 55,
            child: Text(
              kategori,
              style: FontStyles.w4s12.copyWith(color: textColor),
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
