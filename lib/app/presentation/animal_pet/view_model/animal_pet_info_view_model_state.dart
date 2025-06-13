import 'package:equatable/equatable.dart';
import 'package:fd_admin/app/common/enum/sort_enums/animal_sort_order.dart';
import 'package:fd_admin/app/common/enum/year_quarters_enum.dart';
import 'package:fd_admin/app/common/models/animal_pet_model.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';

class AnimalPetInfoViewModelState with EquatableMixin {
  final ResponseModel<AnimalPetModel>? animalPets;
  final int year;
  final YearQuartersEnum quarter;
  final AnimalSortOrder sortOrder;

  const AnimalPetInfoViewModelState( {
    required this.animalPets,
    required this.year,
    required this.quarter,
    required this.sortOrder
  });

  AnimalPetInfoViewModelState copyWith({
    ValueGetter<ResponseModel<AnimalPetModel>?>? animalPets,
    int? year,
    YearQuartersEnum? quarter,
    AnimalSortOrder? sortOrder,
  }) {
    return AnimalPetInfoViewModelState(
      animalPets: animalPets != null ? animalPets() : this.animalPets,
      year: year ?? this.year,
      quarter: quarter ?? this.quarter,
      sortOrder: sortOrder ?? this.sortOrder,
    );
  }
  
  @override
  List<Object?> get props => [
    animalPets,
    year,
    quarter,
    sortOrder,
  ];

}