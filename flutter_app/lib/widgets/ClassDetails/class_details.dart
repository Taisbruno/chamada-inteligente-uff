import 'package:flutter/material.dart';
import 'package:flutter_app/screens/active_call_professor.dart';
import 'package:flutter_app/widgets/ClassDetails/button.dart';
import 'package:flutter_app/widgets/student_card.dart';

class ClassDetails extends StatelessWidget {
  final String className;
  final String teacher;
  final String semester;
  final String description; // You can add more class details here
  final List<Map<String, String>> students;

  const ClassDetails(
      {super.key,
      required this.className,
      required this.teacher,
      required this.semester,
      required this.description,
      required this.students});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            'Professor: $teacher',
            style: const TextStyle(color: Colors.white),
          ),
          Text('Semestre: $semester',
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
          Text(description, style: const TextStyle(color: Colors.white)),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              button(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ActiveCallScreen()));
              }, "Iniciar chamada", Colors.green),
              // button(() {
              //   print("Em desenvolvimento");
              // }, "Agendar Chamada", Colors.transparent),
              button(() {
                print("Em desenvolvimento");
              }, "Acessar histórico", Colors.transparent),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            'Alunos Inscritos (${students.length}):',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return StudentCard(
                  studentName: students[index]['studentName']!,
                  matricula: students[index]['matricula']!,
                  attendedClasses: students[index]['attendedClasses']!,
                  reproved: students[index]['reproved']!,
                );
              },
            ),
          ),
          // Add more class details here as needed
        ],
      ),
    );
  }
}
