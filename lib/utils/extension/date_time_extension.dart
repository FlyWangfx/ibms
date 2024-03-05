import 'package:date_format/date_format.dart';

extension DateTimeExtension on DateTime {
  String toFormatString(List<String> formats) {
    return formatDate(this, formats);
  }

  String toFormatDateString({
    String split = '-',
  }) {
    return toFormatString(['yyyy', split, 'mm', split, 'dd']);
  }
}
