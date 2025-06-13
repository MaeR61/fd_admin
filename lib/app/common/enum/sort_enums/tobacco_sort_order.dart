enum TobaccoSortOrder { newestFirst, oldestFirst }

extension TobaccoSortOrderExtension on TobaccoSortOrder {
  String get displayName {
    switch (this) {
      case TobaccoSortOrder.newestFirst:
        return 'Newest First';
      case TobaccoSortOrder.oldestFirst:
        return 'Oldest First';
    }
  }

  String get sortParam {
    switch (this) {
      case TobaccoSortOrder.newestFirst:
        return 'desc';
      case TobaccoSortOrder.oldestFirst:
        return 'asc';
    }
  }
}