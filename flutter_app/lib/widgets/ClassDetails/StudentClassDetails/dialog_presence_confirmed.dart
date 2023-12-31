import 'package:flutter/material.dart';
import 'package:flutter_app/utils/TwoDigits.dart';

Widget dialogPresenceConfirmed(BuildContext context) {
  DateTime now = DateTime.now();
  String formattedTime = '${twoDigits(now.hour)}:${twoDigits(now.minute)}';

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle_outline,
          color: Colors.green,
          size: 40,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Presença Confirmada!",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          "Aluno confirmou presença às $formattedTime",
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 15,
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName("/classes"));
            },
            child: const Text(
              "Voltar para Turmas",
              style: TextStyle(color: Colors.purple),
            ))
      ],
    ),
  );
}
