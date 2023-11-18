import 'package:flutter/material.dart';

class StudentCardData {
  final String studentName;
  final String matricula;
  final double frequency;
  final bool reproved;

  StudentCardData(
      {required this.studentName,
      required this.matricula,
      required this.frequency,
      required this.reproved});
}

Widget studentCard(StudentCardData data) {
  String formattedFrequency = data.frequency.toStringAsFixed(0);

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
          Text('Taxa de frequência: $formattedFrequency%'),
          Text('Reprovado por falta: ${data.reproved ? 'Sim' : 'Não'}'),
        ],
      ),
    ),
  );
}
