import 'package:flutter/material.dart';
import 'package:flutter_app/model/Roll.dart';
import 'package:flutter_app/model/User.dart';
import 'package:flutter_app/providers/UserProvider.dart';
import 'package:flutter_app/screens/student_class_details_screen.dart';
import 'package:flutter_app/screens/teacher_class_details_screen.dart';
import 'package:provider/provider.dart';

class ClassCard extends StatelessWidget {
  final String classCode;
  final String className;
  final String teacher;
  final String semester;
  final Color color;
  final List<Roll> rolls;
  final Function(dynamic) onGoBack;

  const ClassCard({
    super.key,
    required this.classCode,
    required this.className,
    required this.teacher,
    required this.semester,
    required this.color,
    required this.onGoBack,
    this.rolls = const [],
  });

  @override
  Widget build(BuildContext context) {
    bool isRollActive = rolls.map((e) => e.finishedAt).contains("null");

    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      color: color,
      child: ListTile(
        leading: isRollActive
            ? Icon(
                Icons.timer_outlined,
                color: Colors.red[400],
              )
            : const Icon(Icons.class_rounded),
        title: Text(
          className,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: _getSubtitleText(isRollActive),
        trailing:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              // Action when the "Join" button is pressed
              // Navigate to the class details page, which is ClassDetails widget in class_details.dart
              _handlePressDetails(context, onGoBack);
            },
            child: const Text('Detalhes'),
          )
        ]),
        onTap: () {
          // Action when the class is tapped (can be different from the "Join" button action)
          // You can add navigation to class details, for example.
        },
      ),
    );
  }

  void _handlePressDetails(BuildContext context, Function(dynamic) onGoBack) {
    UserProvider userProvider =
        Provider.of<UserProvider>(context, listen: false);
    dynamic screen;

    if (userProvider.type == UserType.teacher) {
      screen = TeacherClassDetailsScreen(
          classCode: classCode,
          className: className,
          teacher: teacher,
          semester: semester,
          description: 'Matéria do curso de Sistemas de Informação',
          rolls: rolls);
    } else {
      screen = StudentClassDetailsScreen(
        classCode: classCode,
        className: className,
        teacher: teacher,
        semester: semester,
        description: 'Matéria do curso de Sistemas de Informação',
        roll: rolls.where((element) => element.isOpen).firstOrNull,
      );
    }

    Navigator.of(context)
        .push(
          MaterialPageRoute(builder: (context) => screen),
        )
        .then(onGoBack);
  }

  Widget _getSubtitleText(bool isRollActive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Professor: $teacher',
          style: const TextStyle(fontSize: 13),
          maxLines: 2,
        ),
        if (!isRollActive)
          Text('Semestre: $semester', style: const TextStyle(fontSize: 13)),
        if (isRollActive)
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Text(
              'Chamada em progresso',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.red[800], // Cor vermelha
                  fontWeight: FontWeight.w700,
                  fontSize: 12 // Texto em negrito
                  ),
            ),
          ]),
      ],
    );
  }
}
