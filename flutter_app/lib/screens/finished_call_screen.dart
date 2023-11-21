import 'package:flutter/material.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import 'package:flutter_app/model/Presence.dart';
import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/services/classes/enrolled_students_service.dart';
import 'package:flutter_app/services/roll/presence/presence_service.dart';
import 'package:flutter_app/widgets/FinishedCall/finished_call.dart';
import 'package:flutter_app/widgets/shared/loading.dart';

class FinishedClassScreen extends StatefulWidget {
  final HistoryRoll historyRoll;

  const FinishedClassScreen({super.key, required this.historyRoll});

  @override
  State<FinishedClassScreen> createState() => _FinishedClassState();
}

class _FinishedClassState extends State<FinishedClassScreen> {
  List<String> approved_presences = [];
  bool isLoading = true;
  List<Student> allStudents = [];
  List<Presence> presences = [];

  @override
  void initState() {
    super.initState();
    fetchPresences();
    fetchClassStudents();
  }

  fetchClassStudents() async {
    List<Student> studentsResponse =
        await getStudentsByClass(widget.historyRoll.classCode);

    setState(() {
      allStudents = studentsResponse;
      isLoading = false;
    });
  }

  fetchPresences() async {
    setState(() {
      isLoading = true;
    });

    List<Presence> presencesResponse =
        await getPresenceByRoll(widget.historyRoll.rollId);

    setState(() {
      presences = presencesResponse;
      isLoading = false;
    });
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
          foregroundColor: Colors.white,
          title: const Text('Chamada Ocorrida',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
        ),
        backgroundColor: Colors.transparent,
        body: _page(context),
      ),
    );
  }

  Widget _page(BuildContext context) {
    return isLoading
        ? circularLoading()
        : finishedCall(presences, context, fetchPresences, allStudents);
  }

  updateApprovedPresences(String registration) {
    setState(() {
      approved_presences.add(registration);
    });
  }
}
