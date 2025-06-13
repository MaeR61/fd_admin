import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:fd_admin/app/common/cubits/categories/category_cubit.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/appbar/appbar.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/cards/app_card.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/sections/section.dart';
import 'package:fd_admin/app/presentation/search/view_model/search_view_model.dart';
import 'package:fd_admin/app/presentation/search/widgets/categories.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final darkMode = MaeRHelperFunctions(context).isDarkMode;
    final results = context.watch<SearchViewModel>().state.searchResults;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaeRPrimaryHeaderContainer(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MaeRAppBar(
                    title: Image.asset(
                      darkMode ? ImagePaths.fbLogo : ImagePaths.fwLogo,
                      height: MaeRDeviceUtils.getAppBarHeight() * 0.7,
                    ),
                  ),
                  DikeyBosluk(height: 0.01),
                  Categories(
                    onTap: (category) =>
                        context.read<CategoryCubit>().setCategory(category),
                  ),
                  DikeyBosluk(height: 0.01),
                  MaeRSearchContainer(
                    controller: _searchController,
                    text: context
                        .watch<CategoryCubit>()
                        .state
                        .currentCategory
                        .label,
                  ),
                ],
              ),
            ),
            DikeyBosluk(height: 0.025),
            results == null
                ? CircularProgressIndicator.adaptive()
                : Section.titleAndChild(
                    context: context,
                    sectionTitle: "Results",
                    child: SizedBox(
                      width: context.dynamicWidth(0.9),
                      child: Column(
                        children: List.generate(results.data?.length ?? 0, (
                          index,
                        ) {
                          final item = results.data![index];
                          final categoryLabel =
                              item.category?.label ?? "Unknown";
                          final resultCount = item.total ?? 0;
                          return MaeRHorizontalCard(
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            margin: EdgeInsets.only(bottom: 8),
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: " $categoryLabel ",
                                    style: FontStyles.w6s14.copyWith(
                                      color: ColorConstants.colorPrimary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "has ",
                                    style: FontStyles.w5s14.copyWith(
                                      color: darkMode
                                          ? ColorConstants.colorWhite
                                          : ColorConstants.colorBlack,
                                    ),
                                  ),
                                  TextSpan(
                                    text: resultCount.toString(),
                                    style: FontStyles.w6s14.copyWith(
                                      color: ColorConstants.colorPrimary,
                                    ),
                                  ),
                                  TextSpan(
                                    text: " results.",
                                    style: FontStyles.w5s14.copyWith(
                                      color: darkMode
                                          ? ColorConstants.colorWhite
                                          : ColorConstants.colorBlack,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
            DikeyBosluk(height: 0.025),
            SizedBox(height: MaeRDeviceUtils.getBottomNavigationBarHeight()),
          ],
        ),
      ),
    );
  }
}
