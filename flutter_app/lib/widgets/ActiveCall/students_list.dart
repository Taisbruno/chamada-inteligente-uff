import 'package:flutter/material.dart';

class Student {
  final int id;
  final String name;

  Student({required this.id, required this.name});
}

Widget studentsList(List<Student> studentList) {
  return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
    const Text(
      "Total de alunos presentes: 5",
      style: TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black),
    ),
    const Divider(height: 16, thickness: 1, color: Colors.black),
    for (var student in studentList) studentTile(student)
  ]);
}

Widget studentTile(Student student) {
  return ListTile(
    leading: const Icon(Icons.person),
    title: Text(student.name),
    trailing: IconButton(
      icon: const Icon(
        Icons.remove_circle,
        color: Colors.red,
      ),
      onPressed: () {
        // Insert here the code to remove the student
      },
    ),
  );
}
