import 'package:flutter/material.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import 'package:flutter_app/providers/UserProvider.dart';
import 'package:provider/provider.dart';
import '../../../utils/Toast.dart';

Widget dialogSudentStatics(List<HistoryRoll> historic, BuildContext context) {
  UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);

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
              "Total de Faltas: ${historic.last.presences.where((element) => element.studentRegistration == userProvider.registration).first.frequency}", //puxar o valor via somatorio de faltas
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Reprovado: ${historic.last.presences.where((element) => element.studentRegistration == userProvider.registration).first.failed! ? "Sim" : "Não"}", //puxar o valor via total de aulas/total de faltas
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

double presencePercentage(List<HistoryRoll> historic) {
  return 0.0;
}
