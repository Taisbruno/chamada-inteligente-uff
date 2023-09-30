import 'package:flutter/material.dart';

Widget buildTime(Duration duration) {
  String twoDigits(int n) =>
      n.toString().padLeft(2, '0'); // add 0 in front of digits lower than 10

  final hours = twoDigits(duration.inHours.remainder(60));
  final minutes = twoDigits(duration.inMinutes.remainder(60));
  final seconds = twoDigits(duration.inSeconds.remainder(60));

  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      timeCard(time: hours, label: 'Horas'),
      const SizedBox(width: 12),
      timeCard(time: minutes, label: 'Minutos'),
      const SizedBox(width: 12),
      timeCard(time: seconds, label: 'Segundos')
    ],
  );
}

Widget timeCard({required String time, required String label}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Container(
        alignment: Alignment.center,
        width: 54,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Text(
          time,
          style: const TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 24),
        ),
      ),
      const SizedBox(height: 10),
      Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      )
    ],
  );
}
