import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/FinishedCall/dialog_finished_call.dart';

class FinishedCallStudentCardData {
  final String studentName;
  final String matricula;
  final String presente;
  final int attendedClasses;
  final bool reproved;
  final String? atestado;
  final String mensagem;

  FinishedCallStudentCardData(
      {required this.studentName,
      required this.matricula,
      required this.presente,
      this.attendedClasses = 10,
      this.reproved = false,
      required this.atestado,
      required this.mensagem});
}

Widget finishedCallStudentCard(FinishedCallStudentCardData data) {
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
      trailing: trailingButton(data.presente, data.atestado, data.mensagem),
    ),
  );
}

Widget? trailingButton(String presente, String? atestado, String mensagem) {
  if (presente == "Não") {
    if (atestado!.isNotEmpty) {
      return ElevatedButton(
        onPressed: () {
          dialog_finished_call(atestado, mensagem);
        },
        child: const Text('Visualizar \nAtestado'),
      );
    }
    return null;
  }
  return null;
}
