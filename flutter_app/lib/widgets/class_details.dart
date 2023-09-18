import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/student_card.dart';

class ClassDetails extends StatelessWidget {
  final String className;
  final String teacher;
  final String semester;
  final String description; // You can add more class details here
  final List<Map<String, String>> students;

  ClassDetails(
      {required this.className,
      required this.teacher,
      required this.semester,
      required this.description,
      required this.students});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          className,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Detalhes da Turma:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text('Professor: $teacher'),
            Text('Semestre: $semester'),
            const SizedBox(height: 16),
            const Text(
              'Descrição da matéria:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(description),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Action when the "Agendar Chamada" button is pressed
                    // Add your logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow, // Set the button background color to green
                  ),
                  child: const Text(
                    'Agendar Chamada',
                    style: TextStyle(
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action when the "Histórico de Chamadas" button is pressed
                    // Add your logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue, // Set the button background color to blue
                  ),
                  child: const Text(
                    'Histórico de Chamadas',
                    style: TextStyle(
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Action when the "Iniciar Chamada" button is pressed
                    // Add your logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    Colors.green, // Set the button background color to green
                  ),
                  child: const Text(
                    'Iniciar Chamada',
                    style: TextStyle(
                      color: Colors.white, // Set text color to white
                    ),
                  ),
                ),
              ],
            ),
            Text(
              'Alunos Inscritos (${students.length}):',
              style: const TextStyle(
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
      ),
    );
  }
}
