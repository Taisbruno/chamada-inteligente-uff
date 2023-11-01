// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_app/model/Presence.dart';
import 'package:flutter_app/services/roll/presence/presence_service.dart';
import 'package:flutter_app/utils/Toast.dart';
import 'package:flutter_app/widgets/ClassDetails/button.dart';
import 'package:http/http.dart';

Widget dialogRemoveStudent(BuildContext context, Presence student,
    List<Presence> allPresents, Function(List<Presence>) updateList) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.remove_circle_outline,
          size: 30,
          color: Colors.red,
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          "Tem certeza que deseja invalidar a presença do aluno abaixo?",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 25),
        Text(
          student.studentName,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Matrícula: ${student.studentRegistration!}',
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 25,
        ),
        button(
            onPressed: () async {
              Response response = await invalidatePresence(student.presenceId);

              if (response.statusCode == 200) {
                allPresents.removeWhere((element) =>
                    element.studentRegistration == student.studentRegistration);
                updateList(allPresents);
                showToast(context, "Presença invalidada", "OK");
              } else {
                showToast(context,
                    "Não foi possível invalidar a presença do aluno", "OK");
              }
              Navigator.of(context).pop();
            },
            title: "Remover aluno",
            color: Colors.red),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Cancelar",
            ))
      ],
    ),
  );
}
