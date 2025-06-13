extension DateTimeExtension on DateTime {
  bool isSameDay(DateTime other) {
    return toUtc().year == other.toUtc().year &&
        toUtc().month == other.toUtc().month &&
        toUtc().day == other.toUtc().day;
  }
}
