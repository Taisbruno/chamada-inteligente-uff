import 'package:flutter_app/widgets/class_card.dart'; 

class ClassesScreen extends StatelessWidget {
  final List<Map<String, String>> classes = [
    {
      "className": "Mathematics",
      "teacher": "Mr. Silva",
      "semester": "2023.1",
    },
    {
      "className": "Science",
      "teacher": "Mr. Santos",
      "semester": "2023.1",
    },
    {
      "className": "History",
      "teacher": "Mr. Lima",
      "semester": "2022.2",
    },
    {
      "className": "Geography",
      "teacher": "Mr. Pereira",
      "semester": "2022.2",
    },
    {
      "className": "English",
      "teacher": "Mr. Johnson",
      "semester": "2023.2",
    },
    {
      "className": "Art",
      "teacher": "Mr. Garcia",
      "semester": "2023.2",
    },
    {
      "className": "Physical Education",
      "teacher": "Mr. Martinez",
      "semester": "2022.1",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Classes in Google Classroom Style'),
      ),
      body: ListView.builder(
        itemCount: classes.length,
        itemBuilder: (context, index) {
          return ClassCard(
            className: classes[index]['className']!,
            teacher: classes[index]['teacher']!,
            semester: classes[index]['semester']!,
          );
        },
      ),
    );
  }
}