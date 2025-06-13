import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:fd_admin/app/common/constants/string_constants.dart';
import 'package:fd_admin/app/common/cubits/home_index/home_index_cubit.dart';
import 'package:fd_admin/app/common/enum/section_card_enums.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/appbar/appbar.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/cards/app_card.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fd_admin/app/common/widgets/divider/form_divider.dart';
import 'package:fd_admin/app/presentation/others/view_model/others_info_view_model.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OthersView extends StatelessWidget {
  const OthersView({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = MaeRHelperFunctions(context).isDarkMode;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaeRPrimaryHeaderContainer(
              child: MaeRAppBar(
                title: Image.asset(
                  darkMode ? ImagePaths.fbLogo : ImagePaths.fwLogo,
                  height: MaeRDeviceUtils.getAppBarHeight() * 0.7,
                ),
              ),
            ),
            DikeyBosluk(height: 0.025),
            SizedBox(
              width: context.dynamicWidth(0.9),
              child: Column(
                children: [
                  Text(
                    Stringler.other,
                    style: FontStyles.w8s20.copyWith(
                      color: ColorConstants.colorPrimary,
                    ),
                  ),
                  DikeyBosluk(height: 0.025),
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      context.read<OthersInfoViewModel>().fetchOthers();
                      context.read<HomeIndexCubit>().setCurrentIndex(14);
                    },
                    child: MaeRHorizontalCard(
                      width: context.dynamicWidth(0.9),
                      padding: EdgeInsets.all(8),
                      child: Center(
                        child: Text(
                          Stringler.discontinued,
                          style: FontStyles.w5s12.copyWith(
                            color: darkMode
                                ? ColorConstants.colorWhite
                                : ColorConstants.colorBlack,
                          ),
                        ),
                      ),
                    ),
                  ),
                  MaeRDivider(dividerText: Stringler.more),
                  moreInfo(context, darkMode),
                ],
              ),
            ),
            DikeyBosluk(height: 0.025),
            SizedBox(height: MaeRDeviceUtils.getBottomNavigationBarHeight()),
          ],
        ),
      ),
    );
  }

  Column moreInfo(BuildContext context, bool darkMode) {
    return Column(
      children: List.generate(
        3,
        (index) => index.isEven
            ? MaeRHorizontalCard(
                margin: EdgeInsets.only(bottom: context.dynamicHeight(0.025)),
                width: context.dynamicWidth(0.9),
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: context.dynamicWidth(0.4),
                      child: Image.asset(
                        SectionedCardEnums.values[index + 18].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.4),
                      child: Column(
                        children: [
                          Text(
                            SectionedCardEnums.values[index + 18].title,
                            style: FontStyles.w6s14.copyWith(
                              color: darkMode
                                  ? ColorConstants.colorWhite
                                  : ColorConstants.colorBlack,
                            ),
                          ),
                          Text(
                            SectionedCardEnums.values[index + 18].info,
                            style: FontStyles.w4s12.copyWith(
                              color: darkMode
                                  ? ColorConstants.colorWhite
                                  : ColorConstants.colorBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            : MaeRHorizontalCard(
                width: context.dynamicWidth(0.9),
                margin: EdgeInsets.only(bottom: context.dynamicHeight(0.025)),
                padding: EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: context.dynamicWidth(0.4),
                      child: Column(
                        children: [
                          Text(
                            SectionedCardEnums.values[index + 18].title,
                            style: FontStyles.w6s14.copyWith(
                              color: darkMode
                                  ? ColorConstants.colorWhite
                                  : ColorConstants.colorBlack,
                            ),
                          ),
                          Text(
                            SectionedCardEnums.values[index + 18].info,
                            style: FontStyles.w4s12.copyWith(
                              color: darkMode
                                  ? ColorConstants.colorWhite
                                  : ColorConstants.colorBlack,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: context.dynamicWidth(0.4),
                      child: Image.asset(
                        SectionedCardEnums.values[index + 18].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
