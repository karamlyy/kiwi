import 'package:kiwi/presentation/components/picker/date_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum Calendar { startDate, endDate }

class DatePickerHelper {
  String _startDate = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 60)));
  String _endDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  bool canFetchMore = true;

  String get startDate => _startDate;
  String get endDate => _endDate;

  Future<String?> pickDate(
    Calendar calendar,
    BuildContext context,
    String date,
  ) async {
    DateTime initialDate;
    try {
      initialDate = DateFormat('yyyy-MM-dd').parse(date);
    } catch (e) {
      initialDate = DateTime.now();
    }

    final DateTime? selectedDate = await DatePicker.show(
      context,
      selectedDate: initialDate,
    );

    if (selectedDate != null) {
      final String dateStr = DateFormat('yyyy-MM-dd').format(selectedDate);

      if (calendar == Calendar.startDate) {
        if (DateTime.parse(dateStr).isAfter(DateTime.parse(_endDate))) {
          throw Exception("Başlanğıc tarix, son tarixdən böyük ola bilməz.");
        }
        _startDate = dateStr;
      } else if (calendar == Calendar.endDate) {
        if (DateTime.parse(dateStr).isBefore(DateTime.parse(_startDate))) {
          throw Exception("Son tarix, başlanğıc tarixdən kiçik ola bilməz.");
        }
        _endDate = dateStr;
      }
      return dateStr;
    }
    return null;
  }
}
