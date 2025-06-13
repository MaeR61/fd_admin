import 'package:equatable/equatable.dart';
import 'package:fd_admin/app/common/enum/sort_enums/food_sort_order.dart';
import 'package:fd_admin/app/common/enum/year_quarters_enum.dart';
import 'package:fd_admin/app/common/models/food_model.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';

class FoodsInfoViewModelState with EquatableMixin {
  final ResponseModel<List<FoodModel>?>? foods;
  final int year;
  final YearQuartersEnum quarter;
  final FoodSortOrder sortOrder;

  const FoodsInfoViewModelState({
    required this.foods,
    required this.year,
    required this.quarter,
    required this.sortOrder,
  });

  FoodsInfoViewModelState copyWith({
    ValueGetter<ResponseModel<List<FoodModel>>?>? foods,
    int? year,
    YearQuartersEnum? quarter,
    FoodSortOrder? sortOrder,
  }) {
    return FoodsInfoViewModelState(
      foods: foods != null ? foods.call() : this.foods,
      year: year ?? this.year,
      quarter: quarter ?? this.quarter,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }

  @override
  List<Object?> get props => [foods, year, quarter, sortOrder];
}
