enum AnimalSortOrder { newestFirst, oldestFirst }

extension DrugSortOrderExtension on AnimalSortOrder {
  String get displayName {
    switch (this) {
      case AnimalSortOrder.newestFirst:
        return 'Newest First';
      case AnimalSortOrder.oldestFirst:
        return 'Oldest First';
    }
  }

  String get sortParam {
    switch (this) {
      case AnimalSortOrder.newestFirst:
        return 'desc';
      case AnimalSortOrder.oldestFirst:
        return 'asc';
    }
  }
}