import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/ActiveCall/add_student.dart';
import 'package:flutter_app/widgets/ActiveCall/end_call.dart';
import 'package:flutter_app/widgets/ActiveCall/timer.dart';
import 'package:flutter_app/widgets/ActiveCall/students_list.dart';
import 'package:flutter_app/widgets/ClassDetails/class_details.dart';

class ClassDetailsScreen extends StatefulWidget {
  final String className;
  final String teacher;
  final String semester;
  final String description;

  const ClassDetailsScreen({
    super.key,
    required this.className,
    required this.teacher,
    required this.semester,
    required this.description,
  });

  @override
  State<ClassDetailsScreen> createState() => _ClassDetailsState();
}

class _ClassDetailsState extends State<ClassDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).primaryColor,
          Theme.of(context).primaryColorDark
        ],
      )),
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          title: Text(widget.className,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return ClassDetails(
        className: widget.className,
        teacher: widget.teacher,
        semester: widget.semester,
        description: widget.description,
        students: students);
  }

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
}
