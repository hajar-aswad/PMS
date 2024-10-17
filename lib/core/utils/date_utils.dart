import 'package:flutter/material.dart';
import 'package:pms/core/constants/app_colors.dart';

abstract class DateUtils{
  static Future<String?> choseDate(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      return formatDate(date);
    }
    return null;
  }

  static Future<DateTimeRange?> choseDateRange(BuildContext context) async {
    return await showDateRangePicker(
      context: context,
      initialDateRange: DateTimeRange(
          start: DateTime.now().subtract(const Duration(days: 30)),
          end: DateTime.now()),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
          data: ThemeData(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary90,
              onPrimary: AppColors.primary10,
            ),
          ),
          child: child!),
    );
  }

  static String formatDate(DateTime date) {
    if (date.month < 10) {
      if (date.day < 10) {
        return '${date.year}-0${date.month}-0${date.day}';
      }
      return '${date.year}-0${date.month}-${date.day}';
    }
    if (date.day < 10) {
      if (date.month < 10) {
        return '${date.year}-0${date.month}-0${date.day}';
      }
      return '${date.year}-${date.month}-0${date.day}';
    }
    return '${date.year}-${date.month}-${date.day}';
  }
}