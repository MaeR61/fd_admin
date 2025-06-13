import 'package:equatable/equatable.dart';
import 'package:fd_admin/app/common/enum/sort_enums/tobacco_sort_order.dart';
import 'package:fd_admin/app/common/enum/year_quarters_enum.dart';
import 'package:fd_admin/app/common/models/tobacco_model.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';

class TobaccoInfoViewModelState with EquatableMixin {
  final ResponseModel<List<TobaccoModel>?>? tobacco;
  final int year;
  final YearQuartersEnum quarter;
  final TobaccoSortOrder sortOrder;

  const TobaccoInfoViewModelState({
    required this.tobacco,
    required this.year,
    required this.quarter,
    required this.sortOrder,
  });

  TobaccoInfoViewModelState copyWith({
    ValueGetter<ResponseModel<List<TobaccoModel>>?>? tobacco,
    int? year,
    YearQuartersEnum? quarter,
    TobaccoSortOrder? sortOrder,
  }) {
    return TobaccoInfoViewModelState(
      tobacco: tobacco != null ? tobacco.call() : this.tobacco,
      year: year ?? this.year,
      quarter: quarter ?? this.quarter,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  List<Object?> get props => [tobacco, year, quarter, sortOrder];
}
