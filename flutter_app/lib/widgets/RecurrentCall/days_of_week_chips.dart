import 'package:flutter/material.dart';

Widget buildDaysOfWeekChips(
    List<String> daysOfWeek, List<String> selectedDays, dynamic setState) {
  return Wrap(
    spacing: 8.0, // Gap between chips
    children: List<Widget>.generate(
      daysOfWeek.length,
      (int index) {
        return ChoiceChip(
          label: Text(daysOfWeek[index]),
          selected: selectedDays.contains(daysOfWeek[index]),
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                selectedDays.add(daysOfWeek[index]);
              } else {
                selectedDays.removeWhere((String name) {
                  return name == daysOfWeek[index];
                });
              }
            });
          },
        );
      },
    ),
  );
}
