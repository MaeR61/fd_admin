import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:fd_admin/app/common/cubits/home_index/home_index_cubit.dart';
import 'package:fd_admin/app/common/enum/category_enums.dart';
import 'package:fd_admin/app/common/widgets/appbar/appbar.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/cards/app_card.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/sections/section.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({super.key});

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
            Section.justTitle(context: context, sectionTitle: "Categories"),
            DikeyBosluk(height: 0.025),
            ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: CategoryEnum.values.length - 1,
              itemBuilder: (context, index) => GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  context.read<HomeIndexCubit>().setCurrentIndex(index + 3);
                },
                child: MaeRHorizontalCard(
                  padding: EdgeInsets.all(8),
                  width: context.dynamicWidth(0.9),
                  child: Section.titleWithButton(
                    context: context,
                    sectionTitle: CategoryEnum.values[index + 1].label,
                  ),
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
