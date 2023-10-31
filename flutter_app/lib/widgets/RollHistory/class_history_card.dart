import 'package:flutter/material.dart';

class ClassHistoryCardData {
  final String startTime;  // expected format: "dd/mm/yyyy hh:mm"
  final String endTime;    // expected format: "dd/mm/yyyy hh:mm"
  final double latitude;
  final double longitude;
  final String classCode;

  ClassHistoryCardData({
    required this.startTime,
    required this.endTime,
    required this.latitude,
    required this.longitude,
    required this.classCode,
  });
}

Widget classHistoryCard(ClassHistoryCardData data) {
  return Card(
    elevation: 3,
    margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
    color: Colors.orange[100], // You can customize the card color
    child: ListTile(
      title: Text(
        'Data da Aula: ${data.startTime}',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Text('Término da Aula: ${data.endTime}'),
          Text('Latitude: ${data.latitude.toStringAsFixed(2)}'),
          Text('Longitude: ${data.longitude.toStringAsFixed(2)}'),
        ],
      ),
      trailing: ElevatedButton(
        onPressed: () {
          // Logic to view detailed history or other action.
        },
        child: const Text('Detalhes'),
      ),
    ),
  );
}
