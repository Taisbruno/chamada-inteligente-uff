import 'package:flutter/material.dart';
import 'package:flutter_app/model/Roll.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/screens/active_call_professor.dart';
import 'package:flutter_app/services/classes/enrolled_students_service.dart';
import 'package:flutter_app/widgets/ClassDetails/StudentClassDetails/student_roll.dart';
import 'package:flutter_app/widgets/ClassDetails/button.dart';
import 'package:flutter_app/widgets/ClassDetails/TeacherClassDetails/dialog_start_roll.dart';
import 'package:flutter_app/widgets/ClassDetails/TeacherClassDetails/student_card.dart';

//lista de testes
List<Roll> snapshot = [const Roll(rowId: "rowId", longitude: "500", latitude: "2000", classCode: "1234", createdAt: "10", finishedAt: "20"),
const Roll(rowId: "rowId2", longitude: "500", latitude: "200", classCode: "1234", createdAt: "20", finishedAt: "30")
];

class ClassDetailsData {
  String classCode;
  String className;
  String teacher;
  String semester;
  String description;
  late List<Student> students;

  ClassDetailsData(
      {required this.classCode,
      required this.className,
      required this.teacher,
      required this.semester,
      required this.description,
      this.students = const []});
}

Widget studentClassDetails(ClassDetailsData details, BuildContext context) {
  TextEditingController endTimecontroller = TextEditingController();
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
            button(() {
             //Logica para o aluno registrar presença aqui 
            }, "Registrar Presença", Colors.green),
            button(() {
              print("Em desenvolvimento");
            }, "Automático", Colors.blue), //toggle
          ],
        ),
        const SizedBox(height: 20),
        studentsInfo(snapshot)
        /*
        FutureBuilder(
          builder:
              (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return noRegistry;
            } else {
              return //studentPresence;
            }
          },
        )
        */
      ]));
}

Widget studentsInfo(List<Roll> snapshot) {
  return Expanded(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Chamadas Ocorridas (${snapshot.length}):',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: snapshot.length,
          itemBuilder: (context, index) {

            //arrumar a chamada para o construtor StudentRollData, variavel presence

            return studentRoll(StudentRollData(
                date: snapshot[index].createdAt,
                presence: "Sim",
                time: snapshot[index].createdAt));
          },
        ),
      )
    ],
  ));
}

Widget noRegistry() {
  return Center(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.center,
      child: const Text(
        "Nenhum registro de chamada encontrado.",
        style: TextStyle(color: Colors.white, fontSize: 20.0),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
