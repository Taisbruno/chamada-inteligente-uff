import 'package:flutter/material.dart';
import 'package:flutter_app/utils/TwoDigits.dart';
import 'package:flutter_app/widgets/ClassDetails/StudentClassDetails/dialog_missed_class.dart';

class StudentRollData {
  final String date;
  final bool presence;

  StudentRollData({
    this.date = "01/01/2021",
    this.presence = true,
  });
}

Widget studentRoll(StudentRollData data, BuildContext context) {
  DateTime dtDate = DateTime.parse(data.date);

  String numberData =
      '${twoDigits(dtDate.day)}/${twoDigits(dtDate.month)}/${dtDate.year}';
  String numberHour = '${twoDigits(dtDate.hour)}:${twoDigits(dtDate.minute)}';
  String stringPresence = data.presence ? "Sim" : "Não";

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
        trailing: getTrailing(data.presence, context)),
  );
}

Widget? getTrailing(bool isPresent, BuildContext context) {
  if (!isPresent) {
    bool fileSent = false;
    return buttonMissedClass(context, fileSent);     
  }
  
  return Icon(Icons.check_circle_outline, color: Colors.green[800]);
}

Widget? buttonMissedClass(BuildContext context, bool fileSent){
  return ElevatedButton(
    onPressed: () async {
      showDialog(
        context: context,
        builder: (BuildContext context) => Dialog(
          child: MissedClass(context, fileSent),
        )
      );
    },
    style: ElevatedButton.styleFrom(minimumSize: Size(115, 30)),
    child: const Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Text(
        'Justificar\nFalta',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
      ),
    )
  );  
}
