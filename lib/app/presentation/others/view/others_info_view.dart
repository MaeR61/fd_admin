import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:fd_admin/app/common/enum/sort_enums/other_sort_order.dart';
import 'package:fd_admin/app/common/models/other_model.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/appbar/appbar.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/bosluk/yatay_bosluk.dart';
import 'package:fd_admin/app/common/widgets/cards/app_card.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fd_admin/app/presentation/others/view_model/others_info_view_model.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/date_formatter.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OthersInfoView extends StatefulWidget {
  const OthersInfoView({super.key});

  @override
  State<OthersInfoView> createState() => _OthersInfoViewState();
}

class _OthersInfoViewState extends State<OthersInfoView> {
  @override
  Widget build(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;
    final other = context.watch<OthersInfoViewModel>().state.other;

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
                child: QuarterDateSelector(dark: dark),
              ),
            ),
            DikeyBosluk(height: 0.025),
            other == null
                //Veri çekiliyor
                ? Center(child: CircularProgressIndicator.adaptive())
                : other.success == true
                //Veri Geldi
                ? Center(
                    child: SizedBox(
                      width: context.dynamicWidth(0.9),
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: other.data?.length ?? 0,
                        itemBuilder: (_, index) => otherInfoCard(
                          context,
                          other.data![index],
                          index,
                          dark,
                        ),
                      ),
                    ),
                  )
                //Veri Gelmedi
                : Center(
                    child: SizedBox(
                      width: context.dynamicWidth(0.9),
                      child: MaeRHorizontalCard(
                        height: context.dynamicHeight(0.05),
                        child: Center(
                          child: Text(
                            textAlign: TextAlign.center,
                            other.message.toString(),
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

  MaeRHorizontalCard otherInfoCard(
    BuildContext context,
    OtherModel other,
    int index,
    bool dark,
  ) {
    return MaeRHorizontalCard(
      width: context.dynamicWidth(0.9),
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(
                  Icons.more_horiz,
                  size: 28,
                  color: ColorConstants.colorPrimary,
                ),
                YatayBosluk(width: 0.025),
                Expanded(
                  child: Text(
                    other.productType ?? "",
                    style: FontStyles.w7s16.copyWith(
                      color: ColorConstants.colorPrimary,
                      height: 1,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              other.proprietaryName ?? "",
              style: FontStyles.w5s14.copyWith(
                color: dark
                    ? ColorConstants.colorWhite
                    : ColorConstants.colorBlack,
              ),
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
                    other.dosageForm ?? "",
                    style: FontStyles.w5s14.copyWith(
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
            child: Text(
              other.marketingCategory ?? "",
              style: FontStyles.w5s12.copyWith(
                color: dark
                    ? ColorConstants.colorWhite
                    : ColorConstants.colorBlack,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
            child: Text.rich(
              TextSpan(
                text: "Marketing End Date: ",
                style: FontStyles.w6s14.copyWith(
                  color: dark
                      ? ColorConstants.colorWhite
                      : ColorConstants.colorBlack,
                ),
                children: [
                  TextSpan(
                    text: MaeRFormatter.formatDateWithSpace(
                      other.marketingEndDate ?? "",
                    ),
                    style: FontStyles.w5s12.copyWith(
                      color: dark
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class QuarterDateSelector extends StatelessWidget {
  const QuarterDateSelector({super.key, required this.dark});

  final bool dark;

  @override
  Widget build(BuildContext context) {
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
              final selected = await showModalBottomSheet<OtherSortOrder>(
                context: context,
                builder: (_) => _SortBottomSheet(
                  selectedOrder: context
                      .read<OthersInfoViewModel>()
                      .state
                      .sortOrder,
                ),
              );
              if (selected != null) {
                if (context.mounted) {
                  context.read<OthersInfoViewModel>().updateSortOrder(selected);
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
              context.read<OthersInfoViewModel>().fetchOthers();
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.read<OthersInfoViewModel>().decreaseQuarter();
          },
          child: Icon(
            Icons.arrow_left,
            size: 32,
            color: ColorConstants.colorPrimary,
          ),
        ),
        Text(
          context.watch<OthersInfoViewModel>().state.quarter.displayName,
          style: FontStyles.w6s16.copyWith(
            color: dark ? ColorConstants.colorWhite : ColorConstants.colorBlack,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.read<OthersInfoViewModel>().increaseQuarter();
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => context.read<OthersInfoViewModel>().decreaseYear(),
          child: Icon(
            Icons.arrow_left,
            size: 32,
            color: context.watch<OthersInfoViewModel>().state.year != 0
                ? ColorConstants.colorPrimary
                : ColorConstants.colorGray,
          ),
        ),
        Text(
          context.watch<OthersInfoViewModel>().state.year.toString(),
          style: FontStyles.w6s16.copyWith(
            color: dark ? ColorConstants.colorWhite : ColorConstants.colorBlack,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => context.read<OthersInfoViewModel>().increaseYear(),
          child: Icon(
            Icons.arrow_right,
            size: 32,
            color:
                context.watch<OthersInfoViewModel>().state.year !=
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
  final OtherSortOrder selectedOrder;

  const _SortBottomSheet({required this.selectedOrder});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: OtherSortOrder.values.map((order) {
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
