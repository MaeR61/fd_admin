import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/cubits/categories/category_cubit.dart';
import 'package:fd_admin/app/common/enum/category_enums.dart';
import 'package:fd_admin/app/common/widgets/vertical_image_text/vertical_image_text.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Categories extends StatelessWidget {
  const Categories({super.key, required this.onTap});

  final void Function(CategoryEnum category) onTap;

  @override
  Widget build(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;
    return SizedBox(
      height: context.dynamicHeight(0.11),
      width: double.infinity,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(width: 10),
        padding: EdgeInsets.symmetric(horizontal: context.dynamicWidth(0.05)),
        shrinkWrap: true,
        itemCount: CategoryEnum.values.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, index) {
          final category = CategoryEnum.values[index];
          return VerticalImageText(
            index: index,
            icon: (Icon(
              category.icon,
              size:
                  context.watch<CategoryCubit>().state.currentCategory ==
                      category
                  ? 40
                  : 28,
              color:
                  context.watch<CategoryCubit>().state.currentCategory ==
                      category
                  ? ColorConstants.colorPrimary
                  : dark
                  ? ColorConstants.colorBlack
                  : ColorConstants.colorWhite,
            )),
            kategori: category.label,
            textColor: dark
                ? ColorConstants.colorBlack
                : ColorConstants.colorWhite,
            backgroundColor: ColorConstants.colorCarolineBlue,
            onTap: () {
              onTap(category);
            },
          );
        },
      ),
    );
  }
}
