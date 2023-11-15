import 'package:flutter/material.dart';

Widget dialogFinishedRoll(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.access_time_filled_rounded,
          size: 30,
          color: Colors.red,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Essa chamada chegou ao fim",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 25),
        Text(
          "Você será redirecionado para a tela de turmas",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName("/classes"));
            },
            child: const Text(
              "Entendi",
            ))
      ],
    ),
  );
}
