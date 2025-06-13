import 'package:equatable/equatable.dart';
import 'package:fd_admin/app/common/enum/sort_enums/drug_sort_order.dart';
import 'package:fd_admin/app/common/enum/year_quarters_enum.dart';
import 'package:fd_admin/app/common/models/drug_model.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';

class DrugInfoViewModelState with EquatableMixin {
  final ResponseModel<List<DrugModel>?>? drugs;
  final int year;
  final YearQuartersEnum quarter;
  final DrugSortOrder sortOrder;


  const DrugInfoViewModelState( {
    required this.drugs,
    required this.year,
    required this.quarter,
    required this.sortOrder
  });

  DrugInfoViewModelState copyWith({
    ValueGetter<ResponseModel<List<DrugModel>>?>? drugs,
    int? year,
    YearQuartersEnum? quarter,
    DrugSortOrder? sortOrder,
  }) {
    return DrugInfoViewModelState(
      drugs: drugs != null ? drugs.call() : this.drugs,
      year: year ?? this.year,
      quarter: quarter ?? this.quarter,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
  
  @override
  List<Object?> get props => [
    drugs,
    year,
    quarter,
    sortOrder,
  ];

}