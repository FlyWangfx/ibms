import 'package:flutter/material.dart';
import 'package:ibms/utils/extension/date_time_extension.dart';

class TGDatePicker extends StatelessWidget {
  final DateTime date;
  final void Function(DateTime) onChangeDate;

  const TGDatePicker({
    Key? key,
    required this.date,
    required this.onChangeDate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(
        "${date.toFormatDateString()}",
        style: TextStyle(fontSize: 13),
      ),
      trailing: const Icon(
        Icons.arrow_drop_down,
        size: 30,
      ),
      onTap: () => onChangeDate(date),
    );
  }
}
