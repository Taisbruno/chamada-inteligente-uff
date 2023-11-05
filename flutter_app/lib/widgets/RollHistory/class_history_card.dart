import 'package:flutter/material.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import 'package:flutter_app/screens/finished_call_screen.dart';
import 'package:flutter_app/utils/TwoDigits.dart';

Widget classHistoryCard(
    BuildContext context, HistoryRoll historyRoll, int index) {
  DateTime dt = DateTime.parse(historyRoll.createdAt);
  DateTime dtFinish = DateTime.parse(historyRoll.finishedAt);

  String createdDate =
      '${twoDigits(dt.day)}/${twoDigits(dt.month)}/${dt.year} ${twoDigits(dt.hour)}:${twoDigits(dt.minute)}';

  String finishDate =
      '${twoDigits(dtFinish.day)}/${twoDigits(dtFinish.month)}/${dtFinish.year} ${twoDigits(dtFinish.hour)}:${twoDigits(dtFinish.minute)}';

  return Card(
    elevation: 5,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    color: Colors.green[100], // You can customize the card color
    child: ListTile(
      title: Text(
        'Aula ${index + 1}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 5),
          const Text('Início da aula:'),
          Text(createdDate,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          const Text('Término da Aula:'),
          Text(finishDate, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
      trailing: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  FinishedClassScreen(historyRoll: historyRoll)));
        },
        child: const Text('Detalhes'),
      ),
    ),
  );
}
