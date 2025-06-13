import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:fd_admin/app/common/constants/string_constants.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/appbar/appbar.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/bosluk/yatay_bosluk.dart';
import 'package:fd_admin/app/common/widgets/cards/app_card.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fd_admin/app/presentation/topics/international/view_model/international_view_model.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class InternationalView extends StatefulWidget {
  const InternationalView({super.key});

  @override
  State<InternationalView> createState() => _InternationalViewState();
}

class _InternationalViewState extends InternationalViewModel {
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
                    Stringler.internationalTitle,
                    style: FontStyles.w8s20.copyWith(
                      color: ColorConstants.colorPrimary,
                    ),
                  ),
                  DikeyBosluk(height: 0.025),
                  Text(
                    Stringler.internationalInfo,
                    style: FontStyles.w6s12.copyWith(
                      color: darkMode
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack,
                    ),
                  ),
                  DikeyBosluk(height: 0.025),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.asset(ImagePaths.international),
                  ),
                  DikeyBosluk(height: 0.025),
                  Text(
                    Stringler.internationalDetail1,
                    style: FontStyles.w5s12.copyWith(
                      color: darkMode
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack,
                    ),
                  ),
                  DikeyBosluk(height: 0.01),
                  Text(
                    Stringler.internationalDetail2,
                    style: FontStyles.w5s12.copyWith(
                      color: darkMode
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack,
                    ),
                  ),
                  DikeyBosluk(height: 0.01),
                  Column(
                    children: List.generate(
                      6,
                      (index) => MaeRHorizontalCard(
                        width: context.dynamicWidth(0.9),
                        margin: EdgeInsets.only(bottom: 20),
                        padding: EdgeInsets.all(12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            MaeRCircularContainer(
                              margin: EdgeInsets.only(bottom: 8),
                              width: 12,
                              height: 12,
                              backgroundColor: ColorConstants.colorPrimary,
                            ),
                            YatayBosluk(width: 0.025),
                            Expanded(
                              child: Text(
                                steps[index],
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  DikeyBosluk(height: 0.01),
                  Text(
                    Stringler.internationalDetail3,
                    style: FontStyles.w5s12.copyWith(
                      color: darkMode
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack,
                    ),
                  ),
                  DikeyBosluk(height: 0.025),
                ],
              ),
            ),
            DikeyBosluk(height: 0.05),
            SizedBox(height: MaeRDeviceUtils.getBottomNavigationBarHeight()),
          ],
        ),
      ),
    );
  }
}
