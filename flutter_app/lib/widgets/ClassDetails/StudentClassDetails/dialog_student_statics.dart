import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../utils/Toast.dart';

Widget dialogSudentStatics(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total de Faltas: 0", //puxar o valor via somatorio de faltas
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Reprovado: Não", //puxar o valor via total de aulas/total de faltas
              style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 18,
              ),
            ),
          ],
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.red),
        ))
      ],
    ),
  );
}

void handleError(BuildContext context, String error) {
  showToast(context, error, "Entendi");
  Navigator.of(context).pop();
}