import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:fd_admin/app/common/constants/string_constants.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/appbar/appbar.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/cards/app_card.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fd_admin/app/presentation/topics/training/view_model/trainig_view_model.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';

class TrainingView extends StatefulWidget {
  const TrainingView({super.key});

  @override
  State<TrainingView> createState() => _TrainingViewState();
}

class _TrainingViewState extends TrainigViewModel {
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
                    Stringler.trainingTitle,
                    style: FontStyles.w8s20.copyWith(
                      color: ColorConstants.colorPrimary,
                    ),
                  ),
                  DikeyBosluk(height: 0.025),
                  Text(
                    Stringler.trainingInfo,
                    style: FontStyles.w6s12.copyWith(
                      color: darkMode
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack,
                    ),
                  ),
                  DikeyBosluk(height: 0.025),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: Image.asset(ImagePaths.training),
                  ),
                  DikeyBosluk(height: 0.025),
                  Text(
                    Stringler.trainingSection1Title,
                    style: FontStyles.w6s12.copyWith(
                      color: darkMode
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack,
                    ),
                  ),
                  DikeyBosluk(height: 0.01),
                  MaeRHorizontalCard(
                    width: context.dynamicWidth(0.9),
                    child: Column(
                      children: [
                        Text(
                          Stringler.trainingSection1Info1,
                          style: FontStyles.w5s12.copyWith(
                            color: darkMode
                                ? ColorConstants.colorWhite
                                : ColorConstants.colorBlack,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            steps1.length,
                            (index) => Container(
                              width: context.dynamicWidth(0.8),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                steps1[index],
                                style: FontStyles.w4s10.copyWith(
                                  color: darkMode
                                      ? ColorConstants.colorWhite
                                      : ColorConstants.colorBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DikeyBosluk(height: 0.025),
                  MaeRHorizontalCard(
                    width: context.dynamicWidth(0.9),
                    child: Column(
                      children: [
                        Text(
                          Stringler.trainingSection1Info2,
                          style: FontStyles.w5s12.copyWith(
                            color: darkMode
                                ? ColorConstants.colorWhite
                                : ColorConstants.colorBlack,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            steps2.length,
                            (index) => Container(
                              width: context.dynamicWidth(0.8),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                steps2[index],
                                style: FontStyles.w4s10.copyWith(
                                  color: darkMode
                                      ? ColorConstants.colorWhite
                                      : ColorConstants.colorBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DikeyBosluk(height: 0.025),
                  MaeRHorizontalCard(
                    width: context.dynamicWidth(0.9),
                    child: Column(
                      children: [
                        Text(
                          Stringler.trainingSection1Info3,
                          style: FontStyles.w5s12.copyWith(
                            color: darkMode
                                ? ColorConstants.colorWhite
                                : ColorConstants.colorBlack,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            steps3.length,
                            (index) => Container(
                              width: context.dynamicWidth(0.8),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                steps3[index],
                                style: FontStyles.w4s10.copyWith(
                                  color: darkMode
                                      ? ColorConstants.colorWhite
                                      : ColorConstants.colorBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DikeyBosluk(height: 0.025),
                  MaeRHorizontalCard(
                    width: context.dynamicWidth(0.9),
                    child: Column(
                      children: [
                        Text(
                          Stringler.trainingSection1Info4,
                          style: FontStyles.w5s12.copyWith(
                            color: darkMode
                                ? ColorConstants.colorWhite
                                : ColorConstants.colorBlack,
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: List.generate(
                            steps4.length,
                            (index) => Container(
                              width: context.dynamicWidth(0.8),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                steps4[index],
                                style: FontStyles.w4s10.copyWith(
                                  color: darkMode
                                      ? ColorConstants.colorWhite
                                      : ColorConstants.colorBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  DikeyBosluk(height: 0.025),
                  Text(
                    Stringler.trainingSection2Title,
                    style: FontStyles.w6s12.copyWith(
                      color: darkMode
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack,
                    ),
                  ),
                  DikeyBosluk(height: 0.01),
                  MaeRHorizontalCard(
                    width: context.dynamicWidth(0.9),
                    child: Column(
                      children: List.generate(
                        steps5.length,
                        (index) => Container(
                          padding: EdgeInsets.all(8),
                          child: Text(
                            steps5[index],
                            style: FontStyles.w4s12.copyWith(
                              color: darkMode
                                  ? ColorConstants.colorWhite
                                  : ColorConstants.colorBlack,
                            ),
                          ),
                        ),
                      ),
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
