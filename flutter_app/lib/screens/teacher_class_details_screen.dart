import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/ClassDetails/TeacherClassDetails/class_details.dart';
import 'package:flutter_app/model/Roll.dart';

class TeacherClassDetailsScreen extends StatefulWidget {
  final String classCode;
  final String className;
  final String teacher;
  final String semester;
  final String description;
  final List<Roll> rolls;

  const TeacherClassDetailsScreen({
    super.key,
    required this.classCode,
    required this.className,
    required this.teacher,
    required this.semester,
    required this.description,
    required this.rolls,
  });

  @override
  State<TeacherClassDetailsScreen> createState() => _ClassDetailsState();
}

class _ClassDetailsState extends State<TeacherClassDetailsScreen> {
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
        body: _page(context),
      ),
    );
  }

  Widget _page(BuildContext context) {
    ClassDetailsData details = ClassDetailsData(
        classCode: widget.classCode,
        className: widget.className,
        teacher: widget.teacher,
        semester: widget.semester,
        description: widget.description,
        rolls: widget.rolls);

    return classDetails(details, context);
  }
}
