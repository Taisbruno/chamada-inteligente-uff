enum UserType { teacher, student }

class User {
  final String registration;
  final String name;
  final String cpf;
  final String email;
  final UserType type;

  const User(
      {required this.registration,
      required this.name,
      required this.cpf,
      required this.email,
      required this.type});

  factory User.fromJson(Map<String, dynamic> json) {
    UserType type;

    if (json['type'] == 'teacher') {
      type = UserType.teacher;
    } else {
      type = UserType.student;
    }
    return User(
        registration: json['registration'],
        name: json['name'],
        cpf: json['registration'],
        email: json['email'],
        type: type);
  }
}
