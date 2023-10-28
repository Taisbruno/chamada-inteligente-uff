import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/ClassDetails/StudentClassDetails/dialog_student_statics.dart';
import 'package:flutter_app/widgets/ClassDetails/StudentClassDetails/student_class_details.dart';

class StudentClassDetailsScreen extends StatefulWidget {
  final String classCode;
  final String className;
  final String teacher;
  final String semester;
  final String description;

  const StudentClassDetailsScreen({
    super.key,
    required this.classCode,
    required this.className,
    required this.teacher,
    required this.semester,
    required this.description,
  });

  @override
  State<StudentClassDetailsScreen> createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentClassDetailsScreen> {
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
              icon: const Icon(Icons.local_pizza),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => Dialog(
                        child: dialogSudentStatics(context),
                ));
              },
            )],
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

    return studentClassDetails(details, context);
  }
}
