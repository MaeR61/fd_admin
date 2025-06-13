import 'package:equatable/equatable.dart';
import 'package:fd_admin/app/common/enum/category_enums.dart';

class CategoryState with EquatableMixin {
  final CategoryEnum currentCategory;


  const CategoryState({
    required this.currentCategory,
  });

  CategoryState copyWith({
    CategoryEnum? currentCategory,
  }) {
    return CategoryState(
      currentCategory: currentCategory ?? this.currentCategory,
    );
  }
  
  @override
  List<Object?> get props => [
    currentCategory,
  ];
}
