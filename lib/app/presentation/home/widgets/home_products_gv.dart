import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/cubits/home_index/home_index_cubit.dart';
import 'package:fd_admin/app/common/enum/category_enums.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/cards/app_card.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeProductsGV extends StatelessWidget {
  const HomeProductsGV({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(0.9),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemCount: 6,
        padding: EdgeInsets.all(0),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: context.dynamicWidth(0.05),
          mainAxisSpacing: context.dynamicWidth(0.05),
        ),
        itemBuilder: (context, index) => GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => context
              .read<HomeIndexCubit>()
              .setCurrentIndex(index + 3),
          child: MaeRHorizontalCard(
            width: context.dynamicWidth(0.4),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: context.dynamicWidth(0.35),
                    child: Icon(
                      CategoryEnum.values[index + 1].icon,
                      size: 32,
                    ),
                  ),
                  DikeyBosluk(height: 0.01),
                  Text(
                    CategoryEnum.values[index + 1].label,
                    style: FontStyles.w6s14.copyWith(
                      color: ColorConstants.colorCarolineBlue,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}