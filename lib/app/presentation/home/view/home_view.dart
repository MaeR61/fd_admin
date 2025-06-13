import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:fd_admin/app/common/cubits/home_index/home_index_cubit.dart';
import 'package:fd_admin/app/common/enum/home_section_enums.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/appbar/appbar.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/cards/app_card.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fd_admin/app/common/widgets/slider/featured_carousel_slider.dart';
import 'package:fd_admin/app/presentation/home/view_model/home_view_model.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/sections/section.dart';
import 'package:fd_admin/app/presentation/home/widgets/home_products_gv.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    final darkMode = MaeRHelperFunctions(context).isDarkMode;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaeRPrimaryHeaderContainer(
              child: Column(
                children: [
                  MaeRAppBar(
                    title: GestureDetector(
                      child: Image.asset(
                        darkMode ? ImagePaths.fbLogo : ImagePaths.fwLogo,
                        height: MaeRDeviceUtils.getAppBarHeight() * 0.7,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DikeyBosluk(height: 0.025),
            Column(
              children: [
                Section.justTitle(
                  context: context,
                  sectionTitle: HomeSectionEnums.featured.title,
                ),
                FeaturedCarouselSlider(contents: bannerList),
                DikeyBosluk(height: 0.025),
                Section.titleAndChild(
                  context: context,
                  sectionTitle: HomeSectionEnums.products.title,
                  child: HomeProductsGV(),
                ),
                Section.titleAndChild(
                  context: context,
                  sectionTitle: HomeSectionEnums.topics.title,
                  child: SizedBox(
                    width: context.dynamicWidth(0.9),
                    child: Column(
                      children: List.generate(
                        topicsList.length,
                        (index) => MaeRHorizontalCard(
                          width: context.dynamicWidth(0.9),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(
                            bottom: context.dynamicHeight(0.01),
                          ),
                          child: GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => context
                                .read<HomeIndexCubit>()
                                .setCurrentIndex(index + 15),
                            child: Center(
                              child: Text(
                                topicsList[index],
                                style: FontStyles.w5s16.copyWith(
                                  color: darkMode
                                      ? ColorConstants.colorWhite
                                      : ColorConstants.colorBlack,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            DikeyBosluk(height: 0.025),
            SizedBox(height: MaeRDeviceUtils.getBottomNavigationBarHeight()),
          ],
        ),
      ),
    );
  }
}
