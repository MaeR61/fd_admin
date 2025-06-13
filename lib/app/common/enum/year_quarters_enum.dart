import 'package:flutter/material.dart';

enum YearQuartersEnum {
  q1("Quarter 1"),
  q2("Quarter 2"),
  q3("Quarter 3"),
  q4("Quarter 4");

  const YearQuartersEnum(this.displayName);

  final String displayName;

  DateTimeRange range(int year) => switch (this) {
    YearQuartersEnum.q1 => DateTimeRange(
      start: DateTime(year, 1, 1),
      end: DateTime(year, 3, 31),
    ),
    YearQuartersEnum.q2 => DateTimeRange(
      start: DateTime(year, 4, 1),
      end: DateTime(year, 6, 30),
    ),
    YearQuartersEnum.q3 => DateTimeRange(
      start: DateTime(year, 7, 1),
      end: DateTime(year, 9, 30),
    ),
    YearQuartersEnum.q4 => DateTimeRange(
      start: DateTime(year, 10, 1),
      end: DateTime(year, 12, 31),
    ),
  };
  static YearQuartersEnum quarterCalculator(int month) {
    if (month <= 3) {
      return YearQuartersEnum.q1; // Q1
    } else if (month <= 6) {
      return YearQuartersEnum.q2; // Q2
    } else if (month <= 9) {
      return YearQuartersEnum.q3; // Q3
    } else {
      return YearQuartersEnum.q4; // Q4
    }
  }
}
