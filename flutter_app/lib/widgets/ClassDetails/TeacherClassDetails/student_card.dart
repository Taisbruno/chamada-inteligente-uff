import 'package:flutter/material.dart';

class StudentCardData {
  final String studentName;
  final String matricula;
  final int attendedClasses;
  final bool reproved;

  StudentCardData(
      {required this.studentName,
      required this.matricula,
      this.attendedClasses = 10,
      this.reproved = false});
}

Widget studentCard(StudentCardData data) {
  const String numberOfClasses = "100";

  return Card(
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    color: Colors.blue[100], // You can customize the card color
    child: ListTile(
      leading: const Icon(Icons.person),
      title: Text(
        data.studentName,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Matrícula: ${data.matricula}'),
          Text('Aulas comparecidas: ${data.attendedClasses}/$numberOfClasses'),
          Text('Reprovado por falta: ${data.reproved ? 'Sim' : 'Não'}'),
        ],
      ),
    ),
  );
}
