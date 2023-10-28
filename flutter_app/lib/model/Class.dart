class Class {
  final String classCode;
  final String disciplineCode;
  final String discipline;
  final String teacher;
  final String semester;
  final int totalClassDays;

  const Class(
      {required this.classCode,
      required this.disciplineCode,
      required this.discipline,
      required this.teacher,
      required this.semester,
      required this.totalClassDays});

  factory Class.fromJson(Map<String, dynamic> json) {
    return Class(
        classCode: json['classCode'],
        disciplineCode: json['disciplineCode'],
        discipline: json['discipline'],
        teacher: json['teacher'],
        semester: json['semester'],
        totalClassDays: json['total']);
  }
}
