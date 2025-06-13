import 'package:fd_admin/app/common/enum/sort_enums/drug_sort_order.dart';
import 'package:fd_admin/app/common/enum/year_quarters_enum.dart';
import 'package:fd_admin/app/presentation/drugs/view_model/drug_info_view_model_state.dart';
import 'package:fd_admin/app/services/drug_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DrugInfoViewModel extends Cubit<DrugInfoViewModelState> {
  DrugInfoViewModel()
    : super(
        DrugInfoViewModelState(
          drugs: null,
          year: DateTime.now().year,
          quarter: YearQuartersEnum.quarterCalculator(DateTime.now().month),
          sortOrder: DrugSortOrder.newestFirst,
        ),
      );

  int pageIndex = 0;

  Future<void> fetchFDrugs() async {
    emit(state.copyWith(drugs: () => null));

    final range = state.quarter.range(state.year);
    final data = await DrugApiService().fetchFinishedDrugs(
      limit: 10,
      skip: pageIndex * 10,
      sortOrder: state.sortOrder.sortParam,
      startDate: range.start,
      endDate: range.end,
    );

    emit(state.copyWith(drugs: () => data));
  }

  Future<void> fetchUDrugs() async {
    emit(state.copyWith(drugs: () => null));

    final range = state.quarter.range(state.year);
    final data = await DrugApiService().fetchFinishedDrugs(
      limit: 10,
      skip: pageIndex * 10,
      sortOrder: state.sortOrder.sortParam,
      startDate: range.start,
      endDate: range.end,
    );

    emit(state.copyWith(drugs: () => data));
  }

  void updateSortOrder(DrugSortOrder newOrder) {
    emit(state.copyWith(sortOrder: newOrder));
  }

  Future<void> fetchNextDrugs() async {
    pageIndex++;
    fetchFDrugs();
  }

  Future<void> fetchPreviousDrugs() async {
    if (pageIndex == 0) {
      return;
    }
    pageIndex--;
    fetchFDrugs();
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
