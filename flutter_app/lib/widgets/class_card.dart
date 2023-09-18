import 'package:flutter/material.dart';
import 'class_details.dart';

class ClassCard extends StatelessWidget {
  final String className;
  final String teacher;
  final String semester;
  final Color color;
  final List<Map<String, String>> students = [
    {
      "matricula": "123456",
      "studentName": "John Doe",
      "attendedClasses": "20",
      "reproved": "Reprovado",
    },
    {
      "matricula": "789012",
      "studentName": "Jane Smith",
      "attendedClasses": "22",
      "reproved": "Pendente",
    },
    {
      "matricula": "345678",
      "studentName": "Alice Johnson",
      "attendedClasses": "18",
      "reproved": "Reprovado",
    },
    {
      "matricula": "987654",
      "studentName": "Carlos Silva",
      "attendedClasses": "25",
      "reproved": "Pendente",
    },
    {
      "matricula": "654321",
      "studentName": "Laura Martinez",
      "attendedClasses": "17",
      "reproved": "Reprovado",
    },
    {
      "matricula": "567890",
      "studentName": "David Perez",
      "attendedClasses": "21",
      "reproved": "Pendente",
    },
    {
      "matricula": "112233",
      "studentName": "Sophia Garcia",
      "attendedClasses": "23",
      "reproved": "Pendente",
    },
    {
      "matricula": "445566",
      "studentName": "Lucas Torres",
      "attendedClasses": "19",
      "reproved": "Reprovado",
    },
    {
      "matricula": "998877",
      "studentName": "Mia Hernandez",
      "attendedClasses": "24",
      "reproved": "Pendente",
    },
    {
      "matricula": "112233",
      "studentName": "Eduardo Gonzalez",
      "attendedClasses": "20",
      "reproved": "Reprovado",
    },
    {
      "matricula": "334455",
      "studentName": "Olivia Rodriguez",
      "attendedClasses": "22",
      "reproved": "Pendente",
    },
    {
      "matricula": "667788",
      "studentName": "Liam Miller",
      "attendedClasses": "18",
      "reproved": "Reprovado",
    },
  ];


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
            // Navigate to the class details page, which is ClassDetails widget in class_details.dart
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return ClassDetails(
                  className: className,
                  // Pass the necessary data to ClassDetails
                  teacher: teacher,
                  semester: semester,
                  description:
                      'Lorem ipsum dolor sit amet.', // Provide the actual class description
                  students: students,
                );
              }),
            );
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
