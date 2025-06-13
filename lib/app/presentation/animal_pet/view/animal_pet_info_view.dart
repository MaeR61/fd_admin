import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:fd_admin/app/common/enum/sort_enums/animal_sort_order.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/appbar/appbar.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/bosluk/yatay_bosluk.dart';
import 'package:fd_admin/app/common/widgets/cards/app_card.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fd_admin/app/common/models/animal_pet_model.dart';
import 'package:fd_admin/app/presentation/animal_pet/view_model/animal_pet_info_view_model.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalPetInfoView extends StatefulWidget {
  const AnimalPetInfoView({super.key});

  @override
  State<AnimalPetInfoView> createState() => _AnimalPetInfoViewState();
}

class _AnimalPetInfoViewState extends State<AnimalPetInfoView> {
  @override
  Widget build(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;
    final ap = context.watch<AnimalPetInfoViewModel>().state.animalPets;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaeRPrimaryHeaderContainer(
              child: MaeRAppBar(
                title: Image.asset(
                  dark ? ImagePaths.fbLogo : ImagePaths.fwLogo,
                  height: MaeRDeviceUtils.getAppBarHeight() * 0.7,
                ),
              ),
            ),
            DikeyBosluk(height: 0.025),
            Center(
              child: SizedBox(
                width: context.dynamicWidth(0.7),
                child: QuarterDateSelector(),
              ),
            ),
            DikeyBosluk(height: 0.025),
            ap == null
                ?
                  //Veri çekiliyor
                  Center(child: CircularProgressIndicator.adaptive())
                : ap.success == true
                ?
                  //Veri geldi
                  Center(
                    child: SizedBox(
                      width: context.dynamicWidth(0.9),
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: ap.data!.results.length,
                        itemBuilder: (_, index) =>
                            animalPetInfoCard(context, ap, index, dark),
                      ),
                    ),
                  )
                :
                  //Veri gelmedi
                  Center(
                    child: SizedBox(
                      width: context.dynamicWidth(0.9),
                      child: MaeRHorizontalCard(
                        height: context.dynamicHeight(0.05),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            ap.message.toString(),
                            style: FontStyles.w6s14.copyWith(
                              color: dark
                                  ? ColorConstants.colorWhite
                                  : ColorConstants.colorBlack,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  MaeRHorizontalCard animalPetInfoCard(
    BuildContext context,
    ResponseModel<AnimalPetModel> ap,
    int index,
    bool dark,
  ) {
    return MaeRHorizontalCard(
      width: context.dynamicWidth(0.9),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(Icons.pets, size: 28, color: ColorConstants.colorPrimary),
                YatayBosluk(width: 0.025),
                Text(
                  ap
                          .data!
                          .results[index]
                          .animal!
                          .breed
                          ?.breedComponent
                          ?.first ??
                      "",
                  style: FontStyles.w7s16.copyWith(
                    color: ColorConstants.colorPrimary,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Age:",
                      style: FontStyles.w6s14.copyWith(
                        color: dark
                            ? ColorConstants.colorWhite
                            : ColorConstants.colorBlack,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          ap.data!.results[index].animal?.age?.min ?? "",
                          style: FontStyles.w5s12.copyWith(
                            color: dark
                                ? ColorConstants.colorWhite
                                : ColorConstants.colorBlack,
                          ),
                        ),
                        YatayBosluk(width: 0.01),
                        Text(
                          ap.data!.results[index].animal?.age?.unit ?? "",
                          style: FontStyles.w5s12.copyWith(
                            color: dark
                                ? ColorConstants.colorWhite
                                : ColorConstants.colorBlack,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Weight:",
                      style: FontStyles.w6s14.copyWith(
                        color: dark
                            ? ColorConstants.colorWhite
                            : ColorConstants.colorBlack,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          ap.data!.results[index].animal?.weight?.min ?? "",
                          style: FontStyles.w5s12.copyWith(
                            color: dark
                                ? ColorConstants.colorWhite
                                : ColorConstants.colorBlack,
                          ),
                        ),
                        YatayBosluk(width: 0.01),
                        Text(
                          ap.data!.results[index].animal?.weight?.unit ?? "",
                          style: FontStyles.w5s12.copyWith(
                            color: dark
                                ? ColorConstants.colorWhite
                                : ColorConstants.colorBlack,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Gender:",
                      style: FontStyles.w6s14.copyWith(
                        color: dark
                            ? ColorConstants.colorWhite
                            : ColorConstants.colorBlack,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          ap.data!.results[index].animal?.gender ?? "",
                          style: FontStyles.w5s12.copyWith(
                            color: dark
                                ? ColorConstants.colorWhite
                                : ColorConstants.colorBlack,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(
              color: ColorConstants.colorCarolineBlue,
              radius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.square_rounded,
                  size: 16,
                  color: ColorConstants.colorCarolineBlue,
                ),
                YatayBosluk(width: 0.02),
                Expanded(
                  child: Text(
                    ap.data!.results[index].typeOfInformation ?? "",
                    style: FontStyles.w6s14.copyWith(
                      color: dark
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Row(
              children: [
                Text(
                  "Status: ",
                  style: FontStyles.w6s14.copyWith(
                    color: dark
                        ? ColorConstants.colorWhite
                        : ColorConstants.colorBlack,
                  ),
                ),
                YatayBosluk(width: 0.02),
                Text(
                  ap.data!.results[index].outcome?.first.medicalStatus ?? "",
                  style: FontStyles.w5s12.copyWith(
                    color: dark
                        ? ColorConstants.colorWhite
                        : ColorConstants.colorBlack,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class QuarterDateSelector extends StatelessWidget {
  const QuarterDateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;
    return SizedBox(
      width: context.dynamicWidth(0.7),
      child: Column(
        children: [
          _yearPicker(context),
          DikeyBosluk(height: 0.025),
          _quarterPicker(context),
          DikeyBosluk(height: 0.025),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () async {
              final selected = await showModalBottomSheet<AnimalSortOrder>(
                context: context,
                builder: (_) => _SortBottomSheet(
                  selectedOrder: context
                      .read<AnimalPetInfoViewModel>()
                      .state
                      .sortOrder,
                ),
              );
              if (selected != null) {
                if (context.mounted) {
                  context.read<AnimalPetInfoViewModel>().updateSortOrder(
                  selected,
                );
                }
              }
            },
            child: Container(
              width: context.dynamicWidth(0.7),
              height: context.dynamicHeight(0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.colorCarolineBlue,
              ),
              child: Center(
                child: Text(
                  "Sort",
                  style: FontStyles.w6s18.copyWith(
                    color: dark
                        ? ColorConstants.colorBlack
                        : ColorConstants.colorWhite,
                  ),
                ),
              ),
            ),
          ),

          DikeyBosluk(height: 0.025),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              context.read<AnimalPetInfoViewModel>().fetchAnimalPet();
            },
            child: Container(
              width: context.dynamicWidth(0.7),
              height: context.dynamicHeight(0.05),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: ColorConstants.colorPrimary,
              ),
              child: Center(
                child: Text(
                  "Apply",
                  style: FontStyles.w6s18.copyWith(
                    color: dark
                        ? ColorConstants.colorBlack
                        : ColorConstants.colorWhite,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row _quarterPicker(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.read<AnimalPetInfoViewModel>().decreaseQuarter();
          },
          child: Icon(
            Icons.arrow_left,
            size: 32,
            color: ColorConstants.colorPrimary,
          ),
        ),
        Text(
          context.watch<AnimalPetInfoViewModel>().state.quarter.displayName,
          style: FontStyles.w6s16.copyWith(
            color: dark ? ColorConstants.colorWhite : ColorConstants.colorBlack,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.read<AnimalPetInfoViewModel>().increaseQuarter();
          },
          child: Icon(
            Icons.arrow_right,
            size: 32,
            color: ColorConstants.colorPrimary,
          ),
        ),
      ],
    );
  }

  Row _yearPicker(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => context.read<AnimalPetInfoViewModel>().decreaseYear(),
          child: Icon(
            Icons.arrow_left,
            size: 32,
            color: context.watch<AnimalPetInfoViewModel>().state.year != 0
                ? ColorConstants.colorPrimary
                : ColorConstants.colorGray,
          ),
        ),
        Text(
          context.watch<AnimalPetInfoViewModel>().state.year.toString(),
          style: FontStyles.w6s16.copyWith(
            color: dark ? ColorConstants.colorWhite : ColorConstants.colorBlack,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => context.read<AnimalPetInfoViewModel>().increaseYear(),
          child: Icon(
            Icons.arrow_right,
            size: 32,
            color:
                context.watch<AnimalPetInfoViewModel>().state.year !=
                    DateTime.now().year
                ? ColorConstants.colorPrimary
                : ColorConstants.colorGray,
          ),
        ),
      ],
    );
  }
}

class _SortBottomSheet extends StatelessWidget {
  final AnimalSortOrder selectedOrder;

  const _SortBottomSheet({required this.selectedOrder});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: AnimalSortOrder.values.map((order) {
          final isSelected = order == selectedOrder;
          return ListTile(
            title: Text(
              order.displayName,
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
            trailing: isSelected
                ? Icon(Icons.check, color: Theme.of(context).primaryColor)
                : null,
            onTap: () => Navigator.pop(context, order),
          );
        }).toList(),
      ),
    );
  }
}
