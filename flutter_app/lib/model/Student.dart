class Student {
  final String registration;
  final String name;
  final double frequency;
  final bool failed;

  const Student({
    required this.registration,
    required this.name,
    this.frequency = 0,
    this.failed = false,
  });

  factory Student.fromJson(Map<String, dynamic> json) {
    return Student(
        registration: json['registration'],
        name: json['name'],
        frequency: json['frequency'],
        failed: json['failed']);
  }
}
