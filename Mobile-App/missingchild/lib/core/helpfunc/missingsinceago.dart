import 'package:ai_safetrack/core/services/time_ago.dart';
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
  final text=timeAgo(selectedDateTime);
  
  return (selectedDateTime, text);
}