class Presence {
  final String presenceId;
  final String studentRegistration;
  final String studentName;
  final String medicalCertificate;
  final String message;
  final bool isPresent;
  final String entryTime;
  final String exitTime;
  final String timePresent;
  final double frequency;
  final bool failed;

  const Presence({
    required this.presenceId,
    required this.studentRegistration,
    required this.studentName,
    required this.medicalCertificate,
    required this.message,
    required this.isPresent,
    required this.entryTime,
    required this.exitTime,
    required this.timePresent,
    required this.frequency,
    required this.failed,
  });

  factory Presence.fromJson(Map<String, dynamic> json) {
    return Presence(
      presenceId: json['id'],
      studentRegistration: json['registration'],
      studentName: json['name'],
      medicalCertificate: json['medicalCertificate'],
      message: json['message'],
      isPresent: json['isPresent'],
      entryTime: json['entryTime'],
      exitTime: json['exitTime'],
      timePresent: json['timePresent'],
      frequency: json['frequency'],
      failed: json['failed'],
    );
  }
}
