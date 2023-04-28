import 'package:flutter/material.dart';

class Validators {
  static int checkDates(int startDate, int startMonth, int startYear,
      int endDate, int endMonth, int endYear) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);
    DateTime start = DateTime(startYear, startMonth, startDate);
    DateTime end = DateTime(endYear, endMonth, endDate);

    if (start.isAfter(today) || start.isAtSameMomentAs(today)) {
      if (end.isAfter(start)) {
        return 0;
      } else {
        return 1;
      }
    } else {
      return 2;
    }
  }
}
