import 'package:flutter/material.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/screens/active_call_professor.dart';
import 'package:flutter_app/services/classes/enrolled_students_service.dart';
import 'package:flutter_app/widgets/ClassDetails/button.dart';
import 'package:flutter_app/widgets/FinishedCall/dialog_finished_call.dart';
import 'package:flutter_app/widgets/FinishedCall/finished_call.dart';

class ClassDetailsData {}

Widget finishedCall() {
  TextEditingController endTimecontroller = TextEditingController();
  return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Text(
          'Número de alunos presente: ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Média de Tempo dos alunos: ',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 20),
        studentsList(),
        // FutureBuilder(
        //   future: getStudentsByClass(details.classCode),
        //   builder:
        //       (BuildContext context, AsyncSnapshot<List<Student>> snapshot) {
        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return const CircularProgressIndicator();
        //     }
        //     if (!snapshot.hasData || snapshot.data!.isEmpty) {
        //       return _noStudents();
        //     } else {
        //       return studentsList(snapshot.data!);
        //     }
        //   },
        // )
      ]));
}

Widget studentsList() {
  return Expanded(
      child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Alunos Inscritos (5):',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      Expanded(
        child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return finishedCallCard(StudentCardData(
                studentName: snapshot[index].name,
                matricula: snapshot[index].registration));
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
