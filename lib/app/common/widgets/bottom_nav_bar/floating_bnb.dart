import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/cubits/home_index/home_index_cubit.dart';
import 'package:fd_admin/app/common/enum/bnb_enums.dart';
import 'package:fd_admin/app/common/theme/styles/shadow_styles.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FloatingBnb extends StatelessWidget {
  const FloatingBnb({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = MaeRHelperFunctions(context).isDarkMode;
    return SafeArea(
      child: Container(
        height: 56,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        margin: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: ColorConstants.colorCarolineBlue,
          borderRadius: BorderRadius.circular(999),
          boxShadow: [MaeRShadowStyle.horizontalItemShadowBlack],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            BnbEnums.values.length,
            (index) => GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {
                context.read<HomeIndexCubit>().setCurrentIndex(index);
              },
              child: SizedBox(
                height: context.dynamicHeight(0.05),
                width: context.dynamicHeight(0.05),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AnimatedBar(
                      isActive:
                          context.watch<HomeIndexCubit>().state.currentIndex ==
                          index,
                    ),
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: Icon(
                        BnbEnums.values[index].icon,
                        color:
                            context
                                        .watch<HomeIndexCubit>()
                                        .state
                                        .currentIndex ==
                                    index &&
                                context
                                        .watch<HomeIndexCubit>()
                                        .state
                                        .currentIndex <
                                    3
                            ? ColorConstants.colorPrimary
                            : dark
                            ? ColorConstants.colorBlack
                            : ColorConstants.colorWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedBar extends StatelessWidget {
  const AnimatedBar({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(bottom: 2),
      height: 4,
      width: isActive ? 20 : 0,
      decoration: BoxDecoration(
        color: ColorConstants.colorPrimary,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
