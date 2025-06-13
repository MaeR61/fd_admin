import 'package:equatable/equatable.dart';
import 'package:fd_admin/app/common/enum/sort_enums/other_sort_order.dart';
import 'package:fd_admin/app/common/enum/year_quarters_enum.dart';
import 'package:fd_admin/app/common/models/other_model.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';

class OthersInfoViewModelState with EquatableMixin {
  final ResponseModel<List<OtherModel>?>? other;
  final int year;
  final YearQuartersEnum quarter;
  final OtherSortOrder sortOrder;

  const OthersInfoViewModelState({
    required this.other,
    required this.year,
    required this.quarter,
    required this.sortOrder,
  });

  OthersInfoViewModelState copyWith({
    ValueGetter<ResponseModel<List<OtherModel>>?>? other,
    int? year,
    YearQuartersEnum? quarter,
    OtherSortOrder? sortOrder,
  }) {
    return OthersInfoViewModelState(
      other: other != null ? other.call() : this.other,
      year: year ?? this.year,
      quarter: quarter ?? this.quarter,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  List<Object?> get props => [other, year, quarter, sortOrder];
}
