import 'package:fd_admin/app/common/enum/sort_enums/animal_sort_order.dart';
import 'package:fd_admin/app/common/enum/year_quarters_enum.dart';
import 'package:fd_admin/app/presentation/animal_pet/view_model/animal_pet_info_view_model_state.dart';
import 'package:fd_admin/app/services/animal_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnimalPetInfoViewModel extends Cubit<AnimalPetInfoViewModelState> {
  AnimalPetInfoViewModel()
    : super(
        AnimalPetInfoViewModelState(
          animalPets: null,
          year: DateTime.now().year,
          quarter: YearQuartersEnum.quarterCalculator(DateTime.now().month),
          sortOrder: AnimalSortOrder.newestFirst,
        ),
      );

  int pageIndex = 0;
  String species = "Dog";

  Future<void> fetchAnimalPet({String? species}) async {
    emit(state.copyWith(animalPets: () => null));
    this.species = species ?? this.species;
    final range = state.quarter.range(state.year);
    final data = await AnimalApiService().fetchAdverseEvents(
      startDate: range.start,
      endDate: range.end,
      species: this.species,
      sortOrder: state.sortOrder.sortParam,
      limit: 10,
      skip: pageIndex * 10,
    );

    emit(state.copyWith(animalPets: () => data));
  }

  void updateSortOrder(AnimalSortOrder newOrder) {
    emit(state.copyWith(sortOrder: newOrder));
  }

  Future<void> fetchNextAnimalPet() async {
    pageIndex++;
    fetchAnimalPet(species: species);
  }

  Future<void> fetchPreviousAnimalPet() async {
    if (pageIndex == 0) {
      return;
    }
    pageIndex--;
    fetchAnimalPet(species: species);
  }

  void increaseYear() {
    if (state.year >= DateTime.now().year) {
      return;
    }
    final isLastYear = state.year + 1 == DateTime.now().year;
    final selectedMonth = (DateTime.now().month - 1) ~/ 4;
    emit(
      state.copyWith(
        year: state.year + 1,
        quarter: YearQuartersEnum
            .values[isLastYear ? selectedMonth : state.quarter.index],
      ),
    );
  }

  void decreaseYear() {
    if (state.year <= 0) {
      return;
    }
    emit(state.copyWith(year: state.year - 1));
  }

  void increaseQuarter() {
    final isLastYear = state.year == DateTime.now().year;
    final lastQuarter = (DateTime.now().month - 1) ~/ 4;
    emit(
      state.copyWith(
        quarter:
            YearQuartersEnum.values[(state.quarter.index + 1) %
                (isLastYear ? (lastQuarter + 1) : 4)],
      ),
    );
  }

  void decreaseQuarter() {
    final isLastYear = state.year == DateTime.now().year;
    final lastQuarter = (DateTime.now().month - 1) ~/ 4;
    emit(
      state.copyWith(
        quarter:
            YearQuartersEnum.values[(state.quarter.index - 1) %
                (isLastYear ? (lastQuarter + 1) : 4)],
      ),
    );
  }
}
