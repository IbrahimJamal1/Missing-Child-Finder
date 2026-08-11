import 'package:intl/intl.dart';

String formatReportDate(String date) {
  final dateTime = DateTime.parse(date);

  return DateFormat(
    'dd MMM yyyy • hh:mm a',
  ).format(dateTime);
}