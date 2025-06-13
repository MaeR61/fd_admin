enum DevicesSortOrder { newestFirst, oldestFirst }

extension DevicesSortOrderExtension on DevicesSortOrder {
  String get displayName {
    switch (this) {
      case DevicesSortOrder.newestFirst:
        return 'Newest First';
      case DevicesSortOrder.oldestFirst:
        return 'Oldest First';
    }
  }

  String get sortParam {
    switch (this) {
      case DevicesSortOrder.newestFirst:
        return 'desc';
      case DevicesSortOrder.oldestFirst:
        return 'asc';
    }
  }
}