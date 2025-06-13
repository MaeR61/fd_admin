import 'package:fd_admin/app/common/constants/color_constants.dart';
import 'package:fd_admin/app/common/constants/image_paths.dart';
import 'package:fd_admin/app/common/enum/sort_enums/devices_sort_order.dart';
import 'package:fd_admin/app/common/theme/styles/font_styles.dart';
import 'package:fd_admin/app/common/widgets/appbar/appbar.dart';
import 'package:fd_admin/app/common/widgets/bosluk/dikey_bosluk.dart';
import 'package:fd_admin/app/common/widgets/bosluk/yatay_bosluk.dart';
import 'package:fd_admin/app/common/widgets/cards/app_card.dart';
import 'package:fd_admin/app/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:fd_admin/app/common/models/device_model.dart';
import 'package:fd_admin/app/presentation/devices/view_model/devices_info_view_model.dart';
import 'package:fd_admin/core/extensions/context_extension.dart';
import 'package:fd_admin/core/helpers/date_formatter.dart';
import 'package:fd_admin/core/helpers/device_utility.dart';
import 'package:fd_admin/core/helpers/helpers_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DevicesInfoView extends StatefulWidget {
  const DevicesInfoView({super.key});

  @override
  State<DevicesInfoView> createState() => _DevicesInfoViewState();
}

class _DevicesInfoViewState extends State<DevicesInfoView> {
  @override
  Widget build(BuildContext context) {
    final dark = MaeRHelperFunctions(context).isDarkMode;
    final devices = context.watch<DevicesInfoViewModel>().state.devices;

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
            devices == null
                //Veri çekiliyor
                ? Center(child: CircularProgressIndicator.adaptive())
                : devices.success == true
                //Veri Geldi
                ? Center(
                    child: SizedBox(
                      width: context.dynamicWidth(0.9),
                      child: ListView.separated(
                        separatorBuilder: (context, index) =>
                            SizedBox(height: 16),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: devices.data?.length ?? 0,
                        itemBuilder: (_, index) => devicesInfoCard(
                          context,
                          devices.data![index],
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
                            devices.message.toString(),
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

  MaeRHorizontalCard devicesInfoCard(
    BuildContext context,
    DeviceModel device,
    int index,
    bool dark,
  ) {
    return MaeRHorizontalCard(
      padding: EdgeInsets.all(16),
      width: context.dynamicWidth(0.9),
      margin: EdgeInsets.only(bottom: 12),
      expansionChild: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children:
            device.productCodes
                .map(
                  (pc) => Text(
                    "- ${pc.deviceName} (${pc.code})",
                    style: FontStyles.w4s12.copyWith(
                      color: dark
                          ? ColorConstants.colorWhite
                          : ColorConstants.colorBlack,
                    ),
                  ),
                )
                .expand((e) => [e, SizedBox(height: 4)])
                .toList()
              ..removeLast(),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(Icons.devices, size: 28, color: ColorConstants.colorPrimary),
              YatayBosluk(width: 0.025),
              Expanded(
                child: Text(
                  device.companyName,
                  style: FontStyles.w7s16.copyWith(
                    color: ColorConstants.colorPrimary,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
          DikeyBosluk(height: 0.01),
          Text(
            device.primaryProductCode?.deviceName ?? "",
            style: FontStyles.w5s14.copyWith(
              color: dark
                  ? ColorConstants.colorWhite
                  : ColorConstants.colorBlack,
            ),
          ),
          DikeyBosluk(height: 0.005),
          Divider(
            color: ColorConstants.colorCarolineBlue,
            radius: BorderRadius.circular(10),
          ),
          DikeyBosluk(height: 0.005),
          Row(
            children: [
              Icon(
                Icons.square_rounded,
                size: 16,
                color: ColorConstants.colorCarolineBlue,
              ),
              YatayBosluk(width: 0.02),
              Expanded(
                child: Text(
                  device.primaryProductCode?.medicalSpecialtyDescription ?? "",
                  style: FontStyles.w6s14.copyWith(
                    color: dark
                        ? ColorConstants.colorWhite
                        : ColorConstants.colorBlack,
                  ),
                ),
              ),
            ],
          ),
          DikeyBosluk(height: 0.01),
          Text.rich(
            TextSpan(
              text: "Publish Date: ",
              style: FontStyles.w6s14.copyWith(
                color: dark
                    ? ColorConstants.colorWhite
                    : ColorConstants.colorBlack,
              ),
              children: [
                TextSpan(
                  text: MaeRFormatter.formatDateWithSpace(device.publishDate),
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
              final selected = await showModalBottomSheet<DevicesSortOrder>(
                context: context,
                builder: (_) => _SortBottomSheet(
                  selectedOrder: context
                      .read<DevicesInfoViewModel>()
                      .state
                      .sortOrder,
                ),
              );
              if (selected != null) {
                if (context.mounted) {
                  context.read<DevicesInfoViewModel>().updateSortOrder(
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
              context.read<DevicesInfoViewModel>().fetchDevices();
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
            context.read<DevicesInfoViewModel>().decreaseQuarter();
          },
          child: Icon(
            Icons.arrow_left,
            size: 32,
            color: ColorConstants.colorPrimary,
          ),
        ),
        Text(
          context.watch<DevicesInfoViewModel>().state.quarter.displayName,
          style: FontStyles.w6s16.copyWith(
            color: dark ? ColorConstants.colorWhite : ColorConstants.colorBlack,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            context.read<DevicesInfoViewModel>().increaseQuarter();
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
          onTap: () => context.read<DevicesInfoViewModel>().decreaseYear(),
          child: Icon(
            Icons.arrow_left,
            size: 32,
            color: context.watch<DevicesInfoViewModel>().state.year != 0
                ? ColorConstants.colorPrimary
                : ColorConstants.colorGray,
          ),
        ),
        Text(
          context.watch<DevicesInfoViewModel>().state.year.toString(),
          style: FontStyles.w6s16.copyWith(
            color: dark ? ColorConstants.colorWhite : ColorConstants.colorBlack,
          ),
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => context.read<DevicesInfoViewModel>().increaseYear(),
          child: Icon(
            Icons.arrow_right,
            size: 32,
            color:
                context.watch<DevicesInfoViewModel>().state.year !=
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
  final DevicesSortOrder selectedOrder;

  const _SortBottomSheet({required this.selectedOrder});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: DevicesSortOrder.values.map((order) {
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
