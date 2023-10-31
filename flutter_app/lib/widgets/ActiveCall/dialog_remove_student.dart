import 'package:flutter/material.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/widgets/ClassDetails/button.dart';

Widget dialogRemoveStudent(BuildContext context, Student student,
    List<Student> allPresents, Function(List<Student>) updateList) {
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
          student.name,
          style: const TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Matrícula: ${student.registration!}',
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
            onPressed: () {
              allPresents.removeWhere(
                  (element) => element.registration == student.registration);
              updateList(allPresents);
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
