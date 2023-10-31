// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/services/roll/presence/presence_service.dart';
import 'package:flutter_app/utils/Toast.dart';
import 'package:http/http.dart';

Widget dialogAddStudent(
    BuildContext context, String rollId, List<Student> students) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 18),
    child: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.add_circle_rounded,
            size: 40,
            color: Colors.green,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Selecione o aluno para confirmar a presença:",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 25),
          SizedBox(
            height: 400,
            child: ListView.builder(
                itemCount: students.length,
                itemBuilder: (context, index) {
                  return studentTile(context, students[index], rollId);
                }),
          ),
          const SizedBox(
            height: 25,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                "Cancelar",
              ))
        ],
      ),
    ),
  );
}

Widget studentTile(BuildContext context, Student student, String rollId) {
  return ListTile(
    leading: const Icon(Icons.person),
    title: Text(student.name),
    onTap: () async {
      Response response = await createPresence(student.registration, rollId);
      if (response.statusCode == 200) {
        showToast(context, "Aluno adicionado com sucesso", "OK");
      } else if (response.statusCode == 409) {
        showToast(
            context,
            "Não foi possível completar a ação:\naluno já inscrito na chamada ou chamada já fechada",
            "OK");
      } else {
        showToast(context, "Não foi possível incluir o aluno na chamada", "OK");
      }
      Navigator.pop(context);
    },
  );
}
