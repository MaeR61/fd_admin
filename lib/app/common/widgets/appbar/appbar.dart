import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/padding_constants.dart';
import 'package:fd_admin/app/common/cubits/home_index/home_index_cubit.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaeRAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MaeRAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.centerTitle = true,
  });

  final Widget? title;
  final bool showBackArrow, centerTitle;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;

    return Padding(
      padding: PaddingConstants.instance.paddingAllOnAlti,
      child: AppBar(
        systemOverlayStyle: dark
            ? SystemUiOverlayStyle.light
            : SystemUiOverlayStyle.dark,
        centerTitle: centerTitle,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton(
                onPressed: MaeRHelperFunctions(context).oncekiSayfayaGit,
                icon: Icon(Icons.arrow_left, size: 20),
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
              )
            : leadingIcon != null
            ? IconButton(
                onPressed: leadingOnPressed,
                icon: Icon(
                  leadingIcon,
                  size: 20,
                  color: dark
                      ? ColorConstants.colorBlack
                      : ColorConstants.colorWhite,
                ),
                alignment: Alignment.center,
                padding: EdgeInsets.zero,
              )
            : null,
        title: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => context.read<HomeIndexCubit>().setCurrentIndex(0),
          child: title,
        ),
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(MaeRDeviceUtils.getAppBarHeight());
}
