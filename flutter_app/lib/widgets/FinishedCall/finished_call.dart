import 'package:flutter/material.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import 'package:flutter_app/model/Presence.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/screens/active_call_professor.dart';
import 'package:flutter_app/services/classes/enrolled_students_service.dart';
import 'package:flutter_app/widgets/ClassDetails/button.dart';
import 'package:flutter_app/widgets/FinishedCall/dialog_finished_call.dart';
import 'package:flutter_app/widgets/FinishedCall/finished_call.dart';
import 'package:flutter_app/widgets/FinishedCall/finished_call_student_card.dart';

Widget finishedCall(HistoryRoll details, BuildContext context) {
  TextEditingController endTimecontroller = TextEditingController();
  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Número de alunos presente: ${details.studentsPresent}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 20),
        studentsList(details.presences),
      ]));
}

Widget studentsList(List<Presence> details) {
  return Expanded(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Alunos Inscritos (${details.length}):',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: details.length,
          itemBuilder: (context, index) {
            return finishedCallStudentCard(FinishedCallStudentCardData(
                studentName: details[index].studentName,
                matricula: details[index].studentRegistration,
                presente: details[index].isPresent ? "Sim" : "Não"));
          },
        ),
      )
    ],
  ));
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
