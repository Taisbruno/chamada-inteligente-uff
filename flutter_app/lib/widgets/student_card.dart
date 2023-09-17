import 'package:flutter/material.dart';

class StudentCard extends StatelessWidget {
  final String studentName;
  final String matricula;

  StudentCard({
    required this.studentName,
    required this.matricula,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: Colors.blue[100], // You can customize the card color
      child: ListTile(
        leading: Icon(Icons.person),
        title: Text(
          studentName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Matricula: $matricula'),
      ),
    );
  }
}
