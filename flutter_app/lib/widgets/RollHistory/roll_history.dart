import 'package:flutter/material.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import 'package:flutter_app/widgets/RollHistory/class_history_card.dart';
import 'package:flutter_app/widgets/shared/button_with_icon.dart';

Widget rollHistory(BuildContext context, List<HistoryRoll> historic) {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: buttonWithIcon(
            title: "Exportar planilha",
            icon: Icons.download_rounded,
            onPress: () {
              print("Em desenvolvimento");
            }),
      ),
      SizedBox(height: 25),
      const Text(
        'Últimas aulas:',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      const SizedBox(height: 20),
      Expanded(child: rollCallList(historic)),
    ]),
  );
}

Widget rollCallList(List<HistoryRoll> historic) {
  return ListView.builder(
    itemCount: historic.length,
    itemBuilder: (context, index) {
      return classHistoryCard(context, historic[index], index);
    },
  );
}
