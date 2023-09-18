import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final String studentName;
  final String matricula;
  final String attendedClasses;
  final String reproved;
  final String numberOfClasses; // numero total de aulas

  StudentCard({
    required this.studentName,
    required this.matricula,
    required this.attendedClasses,
    required this.reproved,
    required this.numberOfClasses,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.blue[100], // You can customize the card color
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(
          studentName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Matrícula: $matricula'),
            Text('Aulas comparecidas: $attendedClasses/$numberOfClasses'),
            Text('Reprovado por falta: $reproved'),
          ],
        ),
      ),
    );
  }
}
