import 'package:fd_admin/app/common/cubits/categories/category_state.dart';
import 'package:fd_admin/app/common/enum/category_enums.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit()
    : super(const CategoryState(currentCategory: CategoryEnum.categoryAll));

  void setCategory(CategoryEnum currentCategory) {
    emit(state.copyWith(currentCategory: currentCategory));
  }
}
