import 'package:fd_admin/app/common/enum/sort_enums/tobacco_sort_order.dart';
import 'package:fd_admin/app/common/enum/year_quarters_enum.dart';
import 'package:fd_admin/app/presentation/tobacco/view_model/tobacco_info_view_model_state.dart';
import 'package:fd_admin/app/services/tobacco_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TobaccoInfoViewModel extends Cubit<TobaccoInfoViewModelState> {
  TobaccoInfoViewModel()
    : super(
        TobaccoInfoViewModelState(
          tobacco: null,
          year: DateTime.now().year,
          quarter: YearQuartersEnum.quarterCalculator(DateTime.now().month),
          sortOrder: TobaccoSortOrder.newestFirst,
        ),
      );

  int pageIndex = 0;

  Future<void> fetchTobaccos() async {
    emit(state.copyWith(tobacco: () => null));

    final range = state.quarter.range(state.year);
    final result = await TobaccoApiService().fetchTobaccos(
      limit: 10,
      skip: pageIndex * 10,
      sortOrder: state.sortOrder.sortParam,
      dateRange: range,
    );

    emit(state.copyWith(tobacco: () => result));
  }

  void updateSortOrder(TobaccoSortOrder newOrder) {
    emit(state.copyWith(sortOrder: newOrder));
  }

  Future<void> fetchNextTobaccos() async {
    pageIndex++;
    fetchTobaccos();
  }

  Future<void> fetchPreviousTobaccos() async {
    if (pageIndex == 0) {
      return;
    }
    pageIndex--;
    fetchTobaccos();
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
