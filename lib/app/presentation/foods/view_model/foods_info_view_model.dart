import 'package:fd_admin/app/common/enum/sort_enums/food_sort_order.dart';
import 'package:fd_admin/app/common/enum/year_quarters_enum.dart';
import 'package:fd_admin/app/presentation/foods/view_model/foods_info_view_model_state.dart';
import 'package:fd_admin/app/services/food_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodsInfoViewModel extends Cubit<FoodsInfoViewModelState> {
  FoodsInfoViewModel()
    : super(
        FoodsInfoViewModelState(
          foods: null,
          year: DateTime.now().year,
          quarter: YearQuartersEnum.quarterCalculator(DateTime.now().month),
          sortOrder: FoodSortOrder.newestFirst
        ),
      );

  int pageIndex = 0;

  Future<void> fetchFoods() async {
    emit(state.copyWith(foods: () => null));

    final range = state.quarter.range(state.year);
    final result = await FoodApiService().fetchFoods(
      limit: 10,
      skip: pageIndex * 10,
      sortOrder: state.sortOrder.sortParam,
      dateRange: range,
    );

    emit(state.copyWith(foods: () => result));
  }

  void updateSortOrder(FoodSortOrder newOrder) {
  emit(state.copyWith(sortOrder: newOrder));
}


  Future<void> fetchNextFoods() async {
    pageIndex++;
    fetchFoods();
  }

  Future<void> fetchPreviousFoods() async {
    if (pageIndex == 0) {
      return;
    }
    pageIndex--;
    fetchFoods();
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
