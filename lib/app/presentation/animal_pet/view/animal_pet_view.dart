import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:fd_admin/app/common/cubits/home_index/home_index_cubit.dart';
import 'package:fd_admin/app/common/enum/animal_pet_enums.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/appbar/appbar.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/cards/app_card.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fd_admin/app/presentation/animal_pet/view_model/animal_pet_info_view_model.dart';
import 'package:fd_admin/app/presentation/animal_pet/view_model/animal_pet_view_model.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalPetView extends StatefulWidget {
  const AnimalPetView({super.key});

  @override
  State<AnimalPetView> createState() => _AnimalPetViewState();
}

class _AnimalPetViewState extends AnimalPetViewModel {
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
                    "Animal & Veterinary",
                    style: FontStyles.w8s20.copyWith(
                      color: ColorConstants.colorPrimary,
                    ),
                  ),
                  DikeyBosluk(height: 0.01),
                  Text(
                    "FDA's Center for Veterinary Medicine. Protecting human and animal health.",
                    style: FontStyles.w6s12.copyWith(
                      color: darkMode
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack,
                    ),
                  ),
                  DikeyBosluk(height: 0.025),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(20),
                    child: Image.asset(ImagePaths.cows),
                  ),
                  DikeyBosluk(height: 0.05),
                  Text(
                    "What are you looking for?",
                    style: FontStyles.w6s12.copyWith(
                      color: ColorConstants.colorCarolineBlue,
                    ),
                  ),
                  GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: 6,
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: context.dynamicWidth(0.05),
                      mainAxisSpacing: context.dynamicWidth(0.05),
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      onTap: () {
                        final selectedSpecies = speciesList[index];
                        context.read<AnimalPetInfoViewModel>().fetchAnimalPet(
                          species: selectedSpecies,
                        );
                        context.read<HomeIndexCubit>().setCurrentIndex(9);
                      },
                      child: MaeRHorizontalCard(
                        width: context.dynamicWidth(0.4),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                width: context.dynamicWidth(0.35),
                                child: Image.asset(
                                  AnimalPetEnums.values[index].icon,
                                ),
                              ),
                              DikeyBosluk(height: 0.01),
                              Text(
                                AnimalPetEnums.values[index].title,
                                style: FontStyles.w5s12.copyWith(
                                  color: ColorConstants.colorPrimary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MaeRDeviceUtils.getBottomNavigationBarHeight()),
          ],
        ),
      ),
    );
  }
}
