import 'package:flutter/material.dart';

class FinishedCallStudentCardData {
  final String studentName;
  final String matricula;
  final String presente;
  final int attendedClasses;
  final bool reproved;

  FinishedCallStudentCardData(
      {required this.studentName,
      required this.matricula,
      required this.presente,
      this.attendedClasses = 10,
      this.reproved = false});
}

Widget finishedCallStudentCard(FinishedCallStudentCardData data) {
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
          Text('Presente: ${data.presente}'),
        ],
      ),
      trailing: ElevatedButton(
        onPressed: () {
          //logica para anexar atestado, verificar se o botão deve aparaecer ou nao. O botão deve aparecer se o aluno faltou
        },
        child: const Text('Visualizar \nAtestado'),
      ),
    ),
  );
}
