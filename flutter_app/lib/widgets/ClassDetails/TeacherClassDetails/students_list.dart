import 'package:flutter/material.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/widgets/ClassDetails/TeacherClassDetails/student_card.dart';

Widget studentsList(List<Student> snapshot) {
  return Expanded(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Alunos Inscritos (${snapshot.length}):',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (context, index) {
            return studentCard(StudentCardData(
                studentName: snapshot[index].name,
                matricula: snapshot[index].registration,
                frequency: snapshot[index].frequency,
                reproved: snapshot[index].failed));
          },
        ),
      )
    ],
  ));
}
