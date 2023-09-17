import 'package:flutter/material.dart';

class ClassDetails extends StatelessWidget {
  final String className;
  final String teacher;
  final String semester;
  final String description; // You can add more class details here

  ClassDetails({
    required this.className,
    required this.teacher,
    required this.semester,
    required this.description,
  });

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
            // Add more class details here as needed
          ],
        ),
      ),
    );
  }
}
