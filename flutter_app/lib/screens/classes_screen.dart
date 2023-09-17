import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/class_card.dart';
import 'package:flutter_app/widgets/custom_app_bar.dart';

class ClassesScreen extends StatelessWidget {
  final Random random = Random();
  final List<Map<String, String>> classes = [
    {
      "className": "Sistemas Operacionais",
      "teacher": "Professor Silva",
      "semester": "2023.1",
    },
    {
      "className": "Desenvolvimento Web",
      "teacher": "Professor Santos",
      "semester": "2023.1",
    },
    {
      "className": "Programacao I",
      "teacher": "Professor Lima",
      "semester": "2022.2",
    },
    {
      "className": "Estrutura de Dados",
      "teacher": "Professor Pereira",
      "semester": "2022.2",
    },
    {
      "className": "Projeto de Software",
      "teacher": "Professor José",
      "semester": "2023.2",
    },
    {
      "className": "Projeto de Aplicacao",
      "teacher": "Professor Garcia",
      "semester": "2023.2",
    },
    {
      "className": "Gerência de Projetos de Hardware",
      "teacher": "Professor Martu",
      "semester": "2022.1",
    },
  ];
  final List<Color> cardColors = [
    Colors.blue[100]!,
    Colors.red[100]!,
    Colors.green[100]!,
    Colors.orange[100]!,
    Colors.purple[100]!,
    Colors.yellow[100]!,
    Colors.brown[100]!,
    Colors.teal[100]!,
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100]!,
      appBar: CustomAppBar(),
      body: 
      Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            child: Text(
              "Turmas",
              style: TextStyle(
                color: Colors.purple[300], // Cor do texto
                fontSize: 24, // Tamanho da fonte
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: classes.length,
              itemBuilder: (context, index) {
                return ClassCard(
                  className: classes[index]['className']!,
                  teacher: classes[index]['teacher']!,
                  semester: classes[index]['semester']!,
                  color: cardColors[random.nextInt(cardColors.length)],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}