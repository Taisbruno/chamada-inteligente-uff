import 'package:flutter_app/model/Roll.dart';

class Class {
  final String classCode;
  final String disciplineCode;
  final String discipline;
  final String teacher;
  final String semester;
  final int totalClassDays;
  final List<Roll> rolls;

  const Class(
      {required this.classCode,
      required this.disciplineCode,
      required this.discipline,
      required this.teacher,
      required this.semester,
      required this.totalClassDays,
      this.rolls = const []});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
        classCode: json['classCode'],
        disciplineCode: json['disciplineCode'],
        discipline: json['discipline'],
        teacher: json['teacher'],
        semester: json['semester'],
        totalClassDays: json['total'],
        rolls: List.from(json['rolls'])
            .map((roll) => Roll(
                rowId: roll['id'],
                longitude: roll['longitude'],
                latitude: roll['latitude'],
                classCode: roll['classCode'],
                createdAt: roll['createdAt'],
                finishedAt: roll['finishedAt'],
                isOpen: roll['isOpen']))
            .toList());
  }
}
