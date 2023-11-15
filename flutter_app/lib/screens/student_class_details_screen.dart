// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_app/model/HistoryRoll.dart';
import 'package:flutter_app/model/Presence.dart';
import 'package:flutter_app/model/Roll.dart';
import 'package:flutter_app/providers/UserProvider.dart';
import 'package:flutter_app/services/roll/presence/presence_service.dart';
import 'package:flutter_app/services/roll/roll_service.dart';
import 'package:flutter_app/widgets/ClassDetails/StudentClassDetails/dialog_student_statics.dart';
import 'package:flutter_app/widgets/ClassDetails/StudentClassDetails/student_class_details.dart';
import 'package:provider/provider.dart';

class StudentClassDetailsScreen extends StatefulWidget {
  final String classCode;
  final String className;
  final String teacher;
  final String semester;
  final String description;
  final Roll? roll;

  const StudentClassDetailsScreen(
      {super.key,
      required this.classCode,
      required this.className,
      required this.teacher,
      required this.semester,
      required this.description,
      this.roll});

  @override
  State<StudentClassDetailsScreen> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentClassDetailsScreen> {
  bool isLoading = false;
  bool isPresent = false;
  List<HistoryRoll> historicRolls = [];

  @override
  void initState() {
    fetchRollPresence(context);
    fetchRolllHistory();
    super.initState();
  }

  fetchRolllHistory() async {
    List<HistoryRoll> historic = await getClassHistoric(widget.classCode);

    setState(() {
      historicRolls = historic;
      isLoading = false;
    });
  }

  fetchRollPresence(BuildContext context) async {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    if (widget.roll != null) {
      setState(() {
        isLoading = true;
      });

      List<Presence> presences = await getPresenceByRoll(widget.roll!.rowId);
      setState(() {
        isLoading = false;
        isPresent = presences
            .map((e) => e.studentRegistration)
            .contains(userProvider.registration);
      });
    }
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
          actions: [
            IconButton(
              icon: const Icon(Icons.bar_chart_outlined),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => Dialog(
                          child: dialogSudentStatics(historicRolls, context),
                        ));
              },
            )
          ],
          foregroundColor: Colors.white,
          title: Text(widget.className,
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
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);

    ClassDetailsData details = ClassDetailsData(
        classCode: widget.classCode,
        className: widget.className,
        teacher: widget.teacher,
        semester: widget.semester,
        description: widget.description,
        openRoll: widget.roll,
        historic: historicRolls,
        userRegistration: userProvider.registration!);

    return studentClassDetails(
        details, context, isPresent, _updatePresence, isLoading);
  }

  _updatePresence() {
    setState(() {
      isPresent = true;
    });
  }
}
