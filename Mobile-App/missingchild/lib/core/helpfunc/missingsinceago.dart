import 'package:flutter/material.dart';

Future<(DateTime, String)?> missingSinceAgo(BuildContext context) async {
  final date = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime.now(),
  );

  if (date == null) return null;

  final time = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );

  if (time == null) return null;

  final selectedDateTime = DateTime(
    date.year,
    date.month,
    date.day,
    time.hour,
    time.minute,
  );

  final diff = DateTime.now().difference(selectedDateTime);

  String text;
  if (diff.inDays >= 365) {
    text = "${diff.inDays ~/ 365} years ago";
  } else if (diff.inDays >= 30) {
    text = "${diff.inDays ~/ 30} months ago";
  } else if (diff.inDays >= 1) {
    text = "${diff.inDays} days ago";
  } else if (diff.inHours >= 1) {
    text = "${diff.inHours} hours ago";
  } else {
    text = "${diff.inMinutes} minutes ago";
  }

  return (selectedDateTime, text);
}