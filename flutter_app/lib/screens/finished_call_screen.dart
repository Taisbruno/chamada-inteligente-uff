import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/FinishedCall/finished_Call.dart';

class FinishedClassDetailsScreen extends StatefulWidget {
  final String classCode;
  final String className;
  final String teacher;
  final String semester;
  final String description;

  const FinishedClassDetailsScreen({
    super.key,
    required this.classCode,
    required this.className,
    required this.teacher,
    required this.semester,
    required this.description,
  });

  @override
  State<FinishedClassDetailsScreen> createState() => _ClassDetailsState();
}

class _ClassDetailsState extends State<FinishedClassDetailsScreen> {
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
    FinishedCallData details = FinishedCallData(
        classCode: widget.classCode,
        className: widget.className,
        teacher: widget.teacher,
        semester: widget.semester,
        description: widget.description);

    return finishedCall(details, context);
  }
}
