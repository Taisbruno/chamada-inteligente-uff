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

  String numberData =
      '${twoDigits(dtDate.day)}/${twoDigits(dtDate.month)}/${dtDate.year}';
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
            Text('Data: $numberData',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            Text('Horário: $numberHour',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
            Text('Presente: $stringPresence',
                style:
                    const TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
          ],
        ),
        trailing: getTrailing(data.presence)),
  );
}

Widget? getTrailing(bool isPresent) {
  if (!isPresent) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(minimumSize: Size(115, 30)),
        onPressed: () {
          //logica para anexar atestado, verificar se o botão deve aparaecer ou nao. O botão deve aparecer se o aluno faltou
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 6),
          child: Text(
            'Anexar\nAtestado',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
        ));
  }

  return Icon(Icons.check_circle_outline, color: Colors.green[800]);
}
