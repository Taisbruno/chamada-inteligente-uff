import 'package:flutter/material.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import 'package:flutter_app/model/Presence.dart';
import 'package:flutter_app/providers/UserProvider.dart';
import 'package:flutter_app/utils/Toast.dart';
import 'package:provider/provider.dart';

Widget dialogSudentStatics(List<HistoryRoll> historic, BuildContext context) {
  UserProvider userProvider = Provider.of<UserProvider>(context, listen: false);

  Presence? presence = historic
      .map((e) => e.presences)
      .where((group) => group.any((element) =>
          element.studentRegistration == userProvider.registration))
      .firstOrNull
      ?.where(
          (element) => element.studentRegistration == userProvider.registration)
      .firstOrNull;

  int attendedClasses = historic
      .map((e) => e.presences)
      .where((group) => group.any((element) =>
          element.studentRegistration == userProvider.registration &&
          element.isPresent == true))
      .length;

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
              "Suas estatísticas",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 30),
            Text(
              "Aulas Comparecidas: $attendedClasses / ${historic.length}",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Taxa de Frequência: ${presencePercentage(presence)}%",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Reprovado: ${getIsFailed(presence)}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
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

String presencePercentage(Presence? presence) {
  if (presence != null) {
    return presence.frequency!.toStringAsFixed(1);
  }
  return "0";
}

String getIsFailed(Presence? presence) {
  if (presence != null) {
    return presence.failed! ? "Sim" : "Não";
  }

  return "??";
}
