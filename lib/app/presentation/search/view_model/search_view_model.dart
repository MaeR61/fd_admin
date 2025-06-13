import 'package:fd_admin/app/common/enum/category_enums.dart';
import 'package:fd_admin/app/presentation/search/view_model/search_view_model_state.dart';
import 'package:fd_admin/app/services/search_api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchViewModel extends Cubit<SearchViewModelState> {
  SearchViewModel()
    : super(
        SearchViewModelState(
          searchResults: null,
        ),
      );


  Future<void> fetchSearchResults(CategoryEnum category, String searchedWord) async {
    emit(state.copyWith(searchResults: () => null));

    final result = await SearchApiService().fetchByCategory(
      category: category,
      query: searchedWord,
      limit: 1,
    );

    emit(state.copyWith(searchResults: () => result));
  }
}
