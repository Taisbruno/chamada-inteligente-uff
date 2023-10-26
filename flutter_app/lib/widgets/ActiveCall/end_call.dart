import 'package:flutter/material.dart';
import 'package:flutter_app/services/roll/roll_service.dart';
import 'package:flutter_app/utils/Toast.dart';

Widget endButton(BuildContext context, String rollId) {
  return ElevatedButton(
    onPressed: () {
      finishRoll(rollId).then((response) {
        if (response.statusCode == 200) {
          Navigator.of(context).pop();
        } else {
          showToast(context, "Erro ao finalizar chamada", "OK");
        }
      });
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
