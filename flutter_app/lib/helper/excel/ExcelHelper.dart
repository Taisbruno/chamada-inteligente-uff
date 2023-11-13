import 'dart:io';

import 'package:excel/excel.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:path_provider/path_provider.dart';

class ExcelHelper {
  Excel excel;
  List<Student> students;
  List<HistoryRoll> rolls;

  ExcelHelper(
      {required this.excel, required this.students, required this.rolls});

  String getSheetName() {
    return 'Histórico de Chamadas';
  }

  Future<Excel> generateExcelSheet(String filename) async {
    excel.rename(excel.getDefaultSheet()!, getSheetName());
    buildStudents();
    buildRolls();
    setWidthAndHeight();
    excel.save(fileName: '$filename.xlsx');

    if (Platform.isAndroid || Platform.isIOS) {
      Directory directory = await getApplicationDocumentsDirectory();
      print(directory.path);
      // File('$directory/chamadas_turma.xlsx')
      //   ..createSync(recursive: true)
      //   ..writeAsBytesSync(bytes!);
    }

    return excel;
  }

  void buildStudents() {
    int row = 1;
    students.forEach((student) {
      excel.updateCell(
          getSheetName(),
          CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: row),
          student.name,
          cellStyle: CellStyle(
              fontSize: 12, bold: true, textWrapping: TextWrapping.Clip));

      row++;
    });
  }

  void buildRolls() {
    int col = 1;
    rolls.forEach((element) {
      DateTime dt = DateTime.parse(element.createdAt);

      excel.updateCell(
          getSheetName(),
          CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0),
          '${dt.day}/${dt.month}',
          cellStyle: CellStyle(
              fontSize: 12,
              bold: true,
              textWrapping: TextWrapping.Clip,
              horizontalAlign: HorizontalAlign.Center,
              verticalAlign: VerticalAlign.Center));

      buildPresences(element, col);

      col++;
    });
  }

  void buildPresences(HistoryRoll roll, int col) {
    int row = 1;

    students.forEach((student) {
      String text = "FALTA";

      if (isStudentPresent(student, roll)) {
        text = "PRESENTE";
      }

      excel.updateCell(getSheetName(),
          CellIndex.indexByColumnRow(columnIndex: col, rowIndex: row), text,
          cellStyle: CellStyle(
              horizontalAlign: HorizontalAlign.Center,
              verticalAlign: VerticalAlign.Center));

      row++;
    });
  }

  bool isStudentPresent(Student student, HistoryRoll roll) {
    return roll.presences
        .where((element) => element.isPresent)
        .map((e) => e.studentRegistration)
        .contains(student.registration);
  }

  void setWidthAndHeight() {
    excel.sheets[getSheetName()]?.setDefaultColumnWidth(15);
    excel.sheets[getSheetName()]?.setColumnWidth(0, 40);
    excel.sheets[getSheetName()]?.setDefaultRowHeight(25);
  }
}
