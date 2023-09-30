import 'package:flutter/material.dart';
import 'package:flutter_app/screens/class_details_screen.dart';
import 'ClassDetails/class_details.dart';

class ClassCard extends StatelessWidget {
  final String className;
  final String teacher;
  final String semester;
  final Color color;

  ClassCard({
    super.key,
    required this.className,
    required this.teacher,
    required this.semester,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: color,
      child: ListTile(
        leading: const Icon(Icons.class_),
        title: Text(
          className,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Professor: $teacher\nSemestre: $semester'),
        trailing: ElevatedButton(
          onPressed: () {
            // Action when the "Join" button is pressed
            // Navigate to the class details page, which is ClassDetails widget in class_details.dart
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => ClassDetailsScreen(
                      className: className,
                      teacher: teacher,
                      semester: semester,
                      description:
                          'Matéria do curso de Sistemas de Informação')),
            );
          },
          child: const Text('Detalhes'),
        ),
        onTap: () {
          // Action when the class is tapped (can be different from the "Join" button action)
          // You can add navigation to class details, for example.
        },
      ),
    );
  }
}
