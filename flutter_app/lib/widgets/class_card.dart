import 'dart:math';
import 'package:flutter/material.dart';

class ClassCard extends StatelessWidget {
  final String className;
  final String teacher;
  final String semester;
  final Color color;

  ClassCard({
    required this.className,
    required this.teacher,
    required this.semester,
    required this.color, 
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: color,
      child: ListTile(
        leading: Icon(Icons.class_),
        title: Text(
          className,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Professor: $teacher\nSemestre: $semester'),
        trailing: ElevatedButton(
          onPressed: () {
            // Action when the "Join" button is pressed
            // You can add navigation to the class, for example.
          },
          child: Text('Detalhes'),
        ),
        onTap: () {
          // Action when the class is tapped (can be different from the "Join" button action)
          // You can add navigation to class details, for example.
        },
      ),
    );
  }
}