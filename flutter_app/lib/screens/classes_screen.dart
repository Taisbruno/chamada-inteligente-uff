import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_app/services/classes/classes_service.dart';
import 'package:flutter_app/widgets/Classes/class_card.dart';
import 'package:flutter_app/widgets/Classes/dialog_user.dart';
import 'package:provider/provider.dart';

import '../model/Class.dart';
import '../providers/UserProvider.dart';

class TeacherClassesScreen extends StatefulWidget {
  const TeacherClassesScreen({super.key});

  @override
  State<TeacherClassesScreen> createState() => _ClassesPageState();
}

class _ClassesPageState extends State<TeacherClassesScreen> {
  final Random random = Random();
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
    final user = Provider.of<UserProvider>(context);

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
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            foregroundColor: Colors.white,
            title: const Text("Turmas",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold)),
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => Dialog(
                            child: dialogUser(context),
                          ));
                },
                icon: const Icon(Icons.person_outline_outlined),
                iconSize: 28,
              )
            ],
          ),
          body: FutureBuilder<List<Class>>(
            future: getClassesByRegistration(user.registration!),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                return _noClassesOrError(snapshot.error.toString());
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return _noClassesOrError(null);
              } else {
                return ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      final classroom = snapshot.data![index];
                      return ClassCard(
                          classCode: classroom.classCode,
                          className: classroom.discipline,
                          teacher: classroom.teacher,
                          semester: classroom.semester,
                          rolls: classroom.rolls,
                          color: cardColors[random.nextInt(cardColors.length)]);
                    });
              }
            },
          )),
    );
  }

  Widget _noClassesOrError(String? error) {
    String text = error != null
        ? 'Erro ao recuperar turmas: $error'
        : 'Você não está cadastrado em nenhuma turma.';

    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        alignment: Alignment.center,
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 20.0),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
