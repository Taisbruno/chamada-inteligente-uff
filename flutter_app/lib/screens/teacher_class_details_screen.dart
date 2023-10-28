import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/ClassDetails/class_details.dart';

class TeacherClassDetailsScreen extends StatefulWidget {
  final String classCode;
  final String className;
  final String teacher;
  final String semester;
  final String description;

  const TeacherClassDetailsScreen({
    super.key,
    required this.classCode,
    required this.className,
    required this.teacher,
    required this.semester,
    required this.description,
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
        description: widget.description);

    return classDetails(details, context);
  }
}
