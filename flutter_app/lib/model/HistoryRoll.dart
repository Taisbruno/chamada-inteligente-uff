import 'package:flutter_app/model/Presence.dart';

class HistoryRoll {
  final String rollId;
  final String longitude;
  final String latitude;
  final String classCode;
  final String createdAt;
  final String finishedAt;
  final bool isOpen;
  final int studentsPresent;
  final double presencePercentage;
  final String presenceTimeAverage;
  final List<Presence> presences;

  const HistoryRoll(
      {required this.rollId,
      required this.longitude,
      required this.latitude,
      required this.classCode,
      required this.createdAt,
      required this.finishedAt,
      this.isOpen = false,
      required this.studentsPresent,
      required this.presencePercentage,
      required this.presenceTimeAverage,
      required this.presences});

  factory HistoryRoll.fromJson(Map<String, dynamic> json) {
    return HistoryRoll(
        rollId: json['id'],
        longitude: json['longitude'],
        latitude: json['latitude'],
        classCode: json['classCode'],
        createdAt: json['createdAt'],
        finishedAt: json['finishedAt'],
        isOpen: json['isOpen'],
        studentsPresent: json['studentsPresent'],
        presencePercentage: double.parse(json['presencePercentage'].toString()),
        presenceTimeAverage: json['presenceTimeAvarage'],
        presences: List.from(json['presences'])
            .map((presence) => Presence(
                presenceId: presence['id'],
                studentRegistration: presence['registration'],
                studentName: presence['name'],
                medicalCertificate: presence['medicalCertificate'],
                message: presence['message'],
                isPresent: presence['isPresent'],
                entryTime: presence['entryTime'],
                exitTime: presence['exitTime'],
                frequency: presence['frequency'],
                failed: presence['failed']))
            .toList());
  }
}
