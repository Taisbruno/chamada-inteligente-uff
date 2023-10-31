import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/FinishedCall/finished_call_student_card.dart';
import 'package:flutter_app/widgets/RollHistory/class_history_card.dart';

class ClassDetailsData {}

Widget rollHistory() {
  return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      const Text(
        'Últimas aulas:',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
      const SizedBox(height: 20),
      chamadaList(),
    ]),
  );
}

Widget chamadaList() {
  // Dummy data for demonstration
  final List<ClassHistoryCardData> classes = [
    ClassHistoryCardData(
      startTime: '01/11/2023 08:00 AM',
      endTime: '01/11/2023 10:00 AM',
      latitude: -23.550520,
      longitude: -46.633308,
      classCode: 'MATH101',
    ),
    ClassHistoryCardData(
      startTime: '02/11/2023 11:00 AM',
      endTime: '02/11/2023 01:00 PM',
      latitude: -23.551620,
      longitude: -46.634408,
      classCode: 'PHY102',
    ),
    // ... You can add more classes as needed
  ];

  return ListView.builder(
    shrinkWrap: true, // makes the ListView children sized to their height
    physics: NeverScrollableScrollPhysics(), // disables the scroll effect
    itemCount: classes.length,
    itemBuilder: (context, index) {
      return classHistoryCard(classes[index]);
    },
  );
}
