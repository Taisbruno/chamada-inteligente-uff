// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/services/classes/enrolled_students_service.dart';
import 'package:flutter_app/widgets/ActiveCall/dialog_add_student.dart';

Widget addStudentButton(BuildContext context, String classCode, String rollId) {
  List<Student> students = [];

  return ElevatedButton(
    onPressed: () async {
      students = await getStudentsByClass(classCode);
      showDialog(
          context: context,
          builder: (context) {
            return Dialog(child: dialogAddStudent(context, rollId, students));
          });
    },
    style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
        backgroundColor: Colors.green.shade800,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
    child: const Text(
      "Adicionar aluno",
      style: TextStyle(
          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}
