enum DrugSortOrder { newestFirst, oldestFirst }

extension DrugSortOrderExtension on DrugSortOrder {
  String get displayName {
    switch (this) {
      case DrugSortOrder.newestFirst:
        return 'Newest First';
      case DrugSortOrder.oldestFirst:
        return 'Oldest First';
    }
  }

  String get sortParam {
    switch (this) {
      case DrugSortOrder.newestFirst:
        return 'desc';
      case DrugSortOrder.oldestFirst:
        return 'asc';
    }
  }
}
