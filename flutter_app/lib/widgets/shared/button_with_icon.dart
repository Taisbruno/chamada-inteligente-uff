import 'package:flutter/material.dart';

Widget buttonWithIcon(
    {required String title,
    required IconData icon,
    required Function onPress,
    Color? color}) {
  return ElevatedButton.icon(
    onPressed: () {
      onPress();
    },
    icon: Icon(icon,
        color: Colors.white), // Adding an icon for more interactivity
    label: Text(
      title,
      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: color ?? Colors.green,
      shape: RoundedRectangleBorder(
        // This gives the button rounded corners
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 12, vertical: 8), // Adjusts the button's padding
    ),
  );
}
