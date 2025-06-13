import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/padding_constants.dart';
import 'package:fd_admin/app/common/cubits/categories/category_cubit.dart';
import 'package:fd_admin/app/presentation/search/view_model/search_view_model.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MaeRSearchContainer extends StatelessWidget {
  const MaeRSearchContainer({
    super.key,
    required this.text,
    required this.controller,
    this.showBackground = true,
    this.showBorder = true,
  });

  final String text;
  final bool showBackground, showBorder;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final darkMode = MaeRHelperFunctions(context).isDarkMode;
    return SizedBox(
      width: context.dynamicWidth(0.9),
      child: Container(
        width: context.dynamicWidth(1),
        padding: PaddingConstants.instance.paddingAllDort,
        decoration: BoxDecoration(
          color: showBackground
              ? darkMode
                    ? ColorConstants.colorGray
                    : ColorConstants.colorWhiteSmoke
              : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: showBorder
              ? Border.all(
                  color: darkMode
                      ? ColorConstants.colorGray
                      : ColorConstants.colorWhiteSmoke,
                )
              : null,
        ),
        child: TextField(
          controller: controller,
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              size: 24,
              color: darkMode
                  ? ColorConstants.colorWhite
                  : ColorConstants.colorBlack,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.send_rounded,
                size: 24,
                color: darkMode
                    ? ColorConstants.colorWhite
                    : ColorConstants.colorBlack,
              ),
              onPressed: () {
                final query = controller.text.trim();
                final category = context
                    .read<CategoryCubit>()
                    .state
                    .currentCategory;
                context.read<SearchViewModel>().fetchSearchResults(
                  category,
                  query,
                );
              },
            ),
            hintText: "Search in $text...",
          ),
        ),
      ),
    );
  }
}
