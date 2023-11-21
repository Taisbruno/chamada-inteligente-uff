import 'package:flutter/material.dart';
import 'package:flutter_app/model/Presence.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/widgets/FinishedCall/finished_call_student_card.dart';

Widget finishedCall(List<Presence> presences, BuildContext context,
    dynamic fetchPresences, List<Student> students) {
  int studentsPresent = presences.where((element) => element.isPresent).length;

  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'Número de alunos presente: $studentsPresent / ${students.length}',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        const SizedBox(height: 20),
        studentsList(context, fetchPresences, presences),
      ]));
}

Widget studentsList(
    BuildContext context, dynamic fetchPresences, List<Presence> details) {
  return Expanded(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Registros na chamada (${details.length}):',
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
            return finishedCallStudentCard(
                context,
                fetchPresences,
                FinishedCallStudentCardData(
                    presences: details,
                    presenceId: details[index].presenceId,
                    studentName: details[index].studentName,
                    matricula: details[index].studentRegistration,
                    presente: details[index].isPresent ? "Sim" : "Não",
                    atestado: details[index].medicalCertificate,
                    mensagem: details[index].message));
          },
        ),
      )
    ],
  ));
}
