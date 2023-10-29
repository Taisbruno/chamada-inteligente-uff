import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_app/model/Roll.dart';
import 'package:flutter_app/widgets/ActiveCall/add_student.dart';
import 'package:flutter_app/widgets/ActiveCall/end_call.dart';
import 'package:flutter_app/widgets/ActiveCall/timer.dart';
import 'package:flutter_app/widgets/ActiveCall/students_list.dart';

class ActiveCallScreen extends StatefulWidget {
  final String classCode;
  final Roll roll;
  final bool isAlreadyOpen;

  const ActiveCallScreen({
    super.key,
    required this.classCode,
    required this.roll,
    this.isAlreadyOpen = false,
  });

  @override
  State<ActiveCallScreen> createState() => _ActiveCallState();
}

class _ActiveCallState extends State<ActiveCallScreen> {
  Duration duration = const Duration();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    super.dispose();
    stopTimer();
  }

  void addTime() {
    const addSeconds = 1;

    setState(() {
      final seconds = duration.inSeconds + addSeconds;

      duration = Duration(seconds: seconds);
    });
  }

  void startTimer() {
    if (widget.isAlreadyOpen) {
      DateTime createdDate = DateTime.parse(widget.roll.createdAt);
      duration =
          Duration(seconds: DateTime.now().difference(createdDate).inSeconds);
    }

    timer = Timer.periodic(const Duration(seconds: 1), (_) => addTime());
  }

  void stopTimer() {
    timer?.cancel();
  }

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
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).popUntil(ModalRoute.withName("/classes"));
            },
          ),
          foregroundColor: Colors.white,
          title: const Text("Chamada Ativa",
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
    return SingleChildScrollView(
        child: Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Essa chamada está ativa há",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  buildTime(duration),
                  const SizedBox(height: 30),
                  endButton(context, widget.roll.rowId),
                  const SizedBox(height: 15),
                  addStudentButton(),
                  const SizedBox(height: 10),
                ],
              ),
            )),
        _container_alunos()
      ],
    ));
  }

  final List<Student> userList = [
    Student(id: 1, name: 'João Marcos'),
    Student(id: 2, name: 'Gabriel Silva'),
    Student(id: 3, name: 'José Oliveira'),
    Student(id: 4, name: 'Lucas Ferreira'),
    Student(id: 5, name: 'Pedro Neves'),
  ];

  Widget _container_alunos() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        alignment: Alignment.topLeft,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 14),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: studentsList(userList),
      ),
    );
  }
}
