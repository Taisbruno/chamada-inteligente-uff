class Student {
  final String registration;
  final String name;

  const Student({
    required this.registration,
    required this.name,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
      registration: json['registration'],
      name: json['name'],
    );
  }
}
