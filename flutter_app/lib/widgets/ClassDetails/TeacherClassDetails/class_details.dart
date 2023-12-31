import 'package:flutter/material.dart';
import 'package:flutter_app/model/Roll.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/screens/active_call_professor.dart';
import 'package:flutter_app/services/classes/enrolled_students_service.dart';
import 'package:flutter_app/utils/TwoDigits.dart';
import 'package:flutter_app/widgets/ClassDetails/TeacherClassDetails/students_list.dart';
import 'package:flutter_app/widgets/ClassDetails/button.dart';
import 'package:flutter_app/widgets/ClassDetails/TeacherClassDetails/dialog_start_roll.dart';
import 'package:flutter_app/widgets/shared/loading.dart';

import '../../../screens/class_roll_historic_screen.dart';
import '../../../screens/recurrent_call_configuration.dart';

class ClassDetailsData {
  String classCode;
  String className;
  String teacher;
  String semester;
  String description;
  List<Roll> rolls;
  late List<Student> students;

  ClassDetailsData(
      {required this.classCode,
      required this.className,
      required this.teacher,
      required this.semester,
      required this.description,
      required this.rolls,
      this.students = const []});
}

Widget classDetails(ClassDetailsData details, BuildContext context) {
  TextEditingController endTimecontroller = TextEditingController();
  Roll? openRoll = details.rolls
      .where((element) => element.finishedAt == "null")
      .firstOrNull;
  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Detalhes da Turma:',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Professor: ${details.teacher}',
          style: const TextStyle(color: Colors.white),
        ),
        Text('Semestre: ${details.semester}',
            style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 16),
        const Text(
          'Descrição da matéria',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        Text(details.description, style: const TextStyle(color: Colors.white)),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            button(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RecurrentChamadaConfiguration(
                            classCode: details.classCode,
                          )));
                },
                title: "Agendar chamada",
                color: Colors.transparent),
            button(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ClassRollHistoricScreen(
                          classCode: details.classCode)));
                },
                title: "Acessar histórico",
                color: Colors.transparent),
          ],
        ),
        const SizedBox(height: 10),
        Center(
          child: getFirstButton(
              openRoll, context, endTimecontroller, details.classCode),
        ),
        const SizedBox(height: 20),
        FutureBuilder(
          future: getStudentsByClass(details.classCode),
          builder:
              (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return circularLoading();
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return _noStudents();
            } else {
              return studentsList(snapshot.data!);
            }
          },
        )
      ]));
}

Widget getFirstButton(Roll? openRoll, BuildContext context,
    TextEditingController controller, String classCode) {
  if (openRoll == null) {
    return button(
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) => Dialog(
                    child: dialogStartRoll(controller, classCode, context),
                  ));
        },
        title: "Iniciar chamada",
        color: Colors.green);
  } else {
    return button(
        onPressed: () {
          String time = '';

          if (openRoll.scheduleCloseTime != '' &&
              openRoll.scheduleCloseTime != 'null') {
            DateTime dt = DateTime.parse(openRoll.scheduleCloseTime);
            time = '${dt.hour}:${twoDigits(dt.minute)}';
          }

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => ActiveCallScreen(
                    classCode: classCode,
                    roll: openRoll,
                    isAlreadyOpen: true,
                    scheduledFinishTime: time,
                  )));
        },
        title: "Ver chamada",
        color: Colors.green);
  }
}

Widget _noStudents() {
  return Center(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: const Text(
        "Nenhum aluno está inscrito nesta turma ainda",
        style: TextStyle(color: Colors.white, fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
