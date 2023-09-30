import 'package:flutter/material.dart';

Widget button(Function onPressed, String title, Color color) {
  return ElevatedButton(
    onPressed: () {
      onPressed();
    },
    style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 14),
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    child: Text(
      title,
      style: const TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
    ),
  );
}
