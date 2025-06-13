import 'package:fd_admin/app/common/enum/sort_enums/other_sort_order.dart';
import 'package:fd_admin/app/common/enum/year_quarters_enum.dart';
import 'package:fd_admin/app/presentation/others/view_model/others_info_view_model_state.dart';
import 'package:fd_admin/app/services/other_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OthersInfoViewModel extends Cubit<OthersInfoViewModelState> {
  OthersInfoViewModel()
    : super(
        OthersInfoViewModelState(
          other: null,
          year: DateTime.now().year,
          quarter: YearQuartersEnum.quarterCalculator(DateTime.now().month),
          sortOrder: OtherSortOrder.newestFirst,
        ),
      );

  int pageIndex = 0;

  Future<void> fetchOthers() async {
    emit(state.copyWith(other: () => null));

    final range = state.quarter.range(state.year);
    final result = await OtherApiService().fetchOthers(
      limit: 10,
      skip: pageIndex * 10,
      sortOrder: state.sortOrder.sortParam,
      dateRange: range,
    );

    emit(state.copyWith(other: () => result));
  }

  void updateSortOrder(OtherSortOrder newOrder) {
    emit(state.copyWith(sortOrder: newOrder));
  }

  Future<void> fetchNextOthers() async {
    pageIndex++;
    fetchOthers();
  }

  Future<void> fetchPreviousOthers() async {
    if (pageIndex == 0) {
      return;
    }
    pageIndex--;
    fetchOthers();
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
