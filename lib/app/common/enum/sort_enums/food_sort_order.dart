enum FoodSortOrder { newestFirst, oldestFirst }

extension FoodSortOrderExtension on FoodSortOrder {
  String get displayName {
    switch (this) {
      case FoodSortOrder.newestFirst:
        return 'Newest First';
      case FoodSortOrder.oldestFirst:
        return 'Oldest First';
    }
  }

  String get sortParam {
    switch (this) {
      case FoodSortOrder.newestFirst:
        return 'desc';
      case FoodSortOrder.oldestFirst:
        return 'asc';
    }
  }
}