import 'package:flutter/material.dart';
import 'package:flutter_app/utils/TwoDigits.dart';

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

  String numberData = '${twoDigits(dtDate.day)}/${twoDigits(dtDate.month)}/${dtDate.year}';
  String numberHour = '${twoDigits(dtDate.hour)}:${twoDigits(dtDate.minute)}';
  String stringPresence = '${data.presence ? "Sim" : "Não"}';

  return Card(
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    color: Colors.blue[100], // You can customize the card color
    child: ListTile(
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Data: $numberData', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Hora: $numberHour', style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Presente: $stringPresence', style: const TextStyle(fontWeight: FontWeight.bold)),
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
