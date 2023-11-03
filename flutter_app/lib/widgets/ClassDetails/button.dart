import 'package:flutter/material.dart';

Widget button(
    {required onPressed,
    required String title,
    required Color color,
    bool disabled = false}) {
  return ElevatedButton(
    onPressed: disabled
        ? null
        : () {
            onPressed();
          },
    style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        disabledBackgroundColor: Colors.white24),
    child: Text(
      title,
      style: TextStyle(
          color: disabled ? Colors.black45 : Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 14),
    ),
  );
}
