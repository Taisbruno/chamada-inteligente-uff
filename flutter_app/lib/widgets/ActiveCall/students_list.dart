import 'package:flutter/material.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/widgets/ActiveCall/dialog_remove_student.dart';

Widget studentsList(BuildContext context, List<Student> studentList,
    Function(List<Student>) updateList) {
  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    Text(
      "Total de alunos presentes: ${studentList.length}",
      style: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
    ),
    const Divider(height: 16, thickness: 1, color: Colors.black),
    for (var student in studentList)
      studentTile(context, student, studentList, updateList)
  ]);
}

Widget studentTile(BuildContext context, student, List<Student> allPresents,
    Function(List<Student>) updateList) {
  return ListTile(
    leading: const Icon(Icons.person),
    title: Text(student.name),
    trailing: IconButton(
      icon: const Icon(
        Icons.remove_circle,
        color: Colors.red,
      ),
      onPressed: () {
        showDialog(
            context: context,
            builder: (context) => Dialog(
                child: dialogRemoveStudent(
                    context, student, allPresents, updateList)));
      },
    ),
  );
}
