import 'package:flutter/material.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import '../../../utils/Toast.dart';

Widget dialogSudentStatics(List<HistoryRoll> historic, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Total de Aulas: ${historic.length}", //puxar o valor via somatorio de faltas
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Total de Faltas: 0", //puxar o valor via somatorio de faltas
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
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
              "Voltar",
            ))
      ],
    ),
  );
}

void handleError(BuildContext context, String error) {
  showToast(context, error, "Entendi");
  Navigator.of(context).pop();
}
