import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class DateTimeUtils {
  static String formatTimeOfDay(TimeOfDay time) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat('HH:mm:ss').format(dt);
  }
}