import 'package:flutter/material.dart';

class StudentRollData {
  final String date;
  final bool presence;

  StudentRollData({
    this.date = "01/01/2021",
    this.presence = true,
  });
}

Widget studentRoll(StudentRollData data) {
  const String numberOfClasses = "100";
  DateTime dtDate = DateTime.parse(data.date);

  return Card(
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    color: Colors.blue[100], // You can customize the card color
    child: ListTile(
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data: ${dtDate.day}/${dtDate.month}/${dtDate.year}'),
            Text('Hora: ${dtDate.hour}:${dtDate.minute}'),
            Text('Presente: ${data.presence ? "Sim" : "Não"}'),
          ],
        ),
        trailing: getTrailing(data.presence)),
  );
}

Widget? getTrailing(bool isPresent) {
  if (!isPresent) {
    return ElevatedButton(
      onPressed: () {
        //logica para anexar atestado, verificar se o botão deve aparaecer ou nao. O botão deve aparecer se o aluno faltou
      },
      child: const Text('Anexar Atestado'),
    );
  }
  return null;
}
