class ClassCard extends StatelessWidget {
  final String className;
  final String teacher;
  final String semester;

  ClassCard({
    required this.className,
    required this.teacher,
    required this.semester,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        leading: Icon(Icons.class_),
        title: Text(
          className,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text('Teacher: $teacher\nSemester: $semester'),
        trailing: ElevatedButton(
          onPressed: () {
            // Action when the "Join" button is pressed
            // You can add navigation to the class, for example.
          },
          child: Text('Join'),
        ),
        onTap: () {
          // Action when the class is tapped (can be different from the "Join" button action)
          // You can add navigation to class details, for example.
        },
      ),
    );
  }
}