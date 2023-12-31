import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/helper/excel/ExcelHelper.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/services/classes/enrolled_students_service.dart';
import 'package:flutter_app/widgets/RollHistory/class_history_card.dart';
import 'package:flutter_app/widgets/shared/button_with_icon.dart';
import 'package:open_file/open_file.dart';

Widget rollHistory(BuildContext context, List<HistoryRoll> historic) {
  historic.sort((a, b) => a.createdAt.compareTo(b.createdAt));
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Center(
        child: buttonWithIcon(
            title: "Exportar planilha",
            icon: Icons.download_rounded,
            onPress: () async {
              List<Student> students =
                  await getStudentsByClass(historic.first.classCode);

              ExcelHelper helper = ExcelHelper(
                  excel: Excel.createExcel(),
                  students: students,
                  rolls: historic);

              String? path = await helper.generateExcelSheet(
                  "Histórico de Chamadas - Cod ${historic.first.classCode}");

              if (path != null) {
                OpenFile.open(path);
              }
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
