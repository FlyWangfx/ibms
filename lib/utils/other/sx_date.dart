import 'package:flutter/material.dart';

class SXDate {
  static Future<DateTime> datePicker(BuildContext context, DateTime date) async {
    DateTime? result = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
    );
    if (result == null) {
      result = date;
    }
    return result;
  }

  static Future<TimeOfDay> timePicker(BuildContext context, TimeOfDay time) async {
    TimeOfDay? result = await showTimePicker(
      context: context,
      initialTime: time,
    );
    if (result == null) {
      result = time;
    }
    return result;
  }

}
