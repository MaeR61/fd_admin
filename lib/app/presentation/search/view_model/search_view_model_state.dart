import 'package:equatable/equatable.dart';
import 'package:fd_admin/app/common/models/meta_model.dart';
import 'package:fd_admin/core/model/response_model.dart';
import 'package:flutter/material.dart';

class SearchViewModelState with EquatableMixin {
  final ResponseModel<List<MetaTotal>?>? searchResults;

  const SearchViewModelState({required this.searchResults});

  SearchViewModelState copyWith({
    ValueGetter<ResponseModel<List<MetaTotal>>?>? searchResults,
  }) {
    return SearchViewModelState(
      searchResults: searchResults != null
          ? searchResults.call()
          : this.searchResults,
    );
  }

  @override
  List<Object?> get props => [searchResults];
}
