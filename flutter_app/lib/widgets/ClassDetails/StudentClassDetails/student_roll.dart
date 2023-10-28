import 'package:flutter/material.dart';

class StudentRollData {
  final String date;
  final String presence;
  final String time;

  StudentRollData(
      {
      this.date = "01/01/2021",
      this.presence = "Sim",
      this.time = "10:00",
      });
}

Widget studentRoll(StudentRollData data) {
  const String numberOfClasses = "100";

  return Card(
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    color: Colors.blue[100], // You can customize the card color
    child: ListTile(
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Data: ${data.date}'),
          Text('Hora: ${data.time}'),
          Text('Presente: ${data.presence}'),
        ],
      ),
      trailing: ElevatedButton(
        onPressed: () {
          //logica para anexar atestado, verificar se o botão deve aparaecer ou nao. O botão deve aparecer se o aluno faltou
        },
        child: const Text('Anexar Atestado'),
      ),
    ),
  );
}
