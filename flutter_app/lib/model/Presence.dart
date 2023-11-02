class Presence {
  final String presenceId;
  final String studentRegistration;
  final String studentName;
  final String? medicalCertificate;
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
    this.medicalCertificate = '',
    required this.message,
    required this.isPresent,
    required this.entryTime,
    required this.exitTime,
    this.timePresent = '',
    this.frequency = 0,
    this.failed = false,
  });

  factory Presence.fromJson(Map<String, dynamic> json) {
    return Presence(
      presenceId: json['id'],
      studentRegistration: json['registration'] ?? json['studentRegistration'],
      studentName: json['name'],
      medicalCertificate: json['medicalCertificate'],
      message: json['message'],
      isPresent: json['isPresent'],
      entryTime: json['entryTime'],
      exitTime: json['exitTime'] ?? '',
    );
  }
}
