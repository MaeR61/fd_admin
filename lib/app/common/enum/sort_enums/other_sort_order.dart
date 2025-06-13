enum OtherSortOrder { newestFirst, oldestFirst }

extension OtherSortOrderExtension on OtherSortOrder {
  String get displayName {
    switch (this) {
      case OtherSortOrder.newestFirst:
        return 'Newest First';
      case OtherSortOrder.oldestFirst:
        return 'Oldest First';
    }
  }

  String get sortParam {
    switch (this) {
      case OtherSortOrder.newestFirst:
        return 'desc';
      case OtherSortOrder.oldestFirst:
        return 'asc';
    }
  }
}