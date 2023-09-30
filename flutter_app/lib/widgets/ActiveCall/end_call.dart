import 'package:flutter/material.dart';

Widget endButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Navigator.of(context).pop();
    },
    style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        backgroundColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    child: const Text(
      "Encerrar chamada",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}
