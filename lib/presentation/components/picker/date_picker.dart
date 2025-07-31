import 'package:kiwi/presentation/shared/shared.dart';
import 'package:flutter/material.dart';

class DatePicker {
  static show(
    context, {
    int? firstDate,
    DateTime? selectedDate,
    DateTime? lastDate,
  }) async {
    return await showDatePicker(
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(firstDate ?? 2015),
      locale: const Locale('en', 'GB'),
      lastDate: lastDate ?? DateTime(2100),
      confirmText: 'Təsdiq et',
      barrierColor: UIColor.black.withValues(alpha:0.3),
      cancelText: 'Ləğv et',
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            shadowColor: UIColor.white,
            datePickerTheme: DatePickerThemeData(
              dividerColor: UIColor.black.withValues(alpha:0.1),
              dayStyle: const TextStyle(fontSize: 13),
              dayShape: WidgetStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              )),
            ),
            colorScheme: ColorScheme.light(
              primary: UIColor.primary,
              onPrimary: UIColor.white,
              surface: UIColor.white,
              onSurface: UIColor.black.withValues(alpha:0.8),
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: UIColor.primary,
              ),
            ),
          ),
          child: Container(
            child: child,
          ),
        );
      },
    );
  }
}
