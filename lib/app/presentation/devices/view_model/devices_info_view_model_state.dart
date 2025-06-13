import 'package:equatable/equatable.dart';
import 'package:fd_admin/app/common/enum/sort_enums/devices_sort_order.dart';
import 'package:fd_admin/app/common/enum/year_quarters_enum.dart';
import 'package:fd_admin/app/common/models/device_model.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';

class DevicesInfoViewModelState with EquatableMixin {
  final ResponseModel<List<DeviceModel>?>? devices;
  final int year;
  final YearQuartersEnum quarter;
  final DevicesSortOrder sortOrder;

  const DevicesInfoViewModelState({
    required this.devices,
    required this.year,
    required this.quarter,
    required this.sortOrder,
  });

  DevicesInfoViewModelState copyWith({
    ValueGetter<ResponseModel<List<DeviceModel>>?>? devices,
    int? year,
    YearQuartersEnum? quarter,
    DevicesSortOrder? sortOrder,
  }) {
    return DevicesInfoViewModelState(
      devices: devices != null ? devices.call() : this.devices,
      year: year ?? this.year,
      quarter: quarter ?? this.quarter,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  List<Object?> get props => [devices, year, quarter, sortOrder];
}
