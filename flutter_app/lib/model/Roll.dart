class Roll {
  final String rowId;
  final String longitude;
  final String latitude;
  final String classCode;
  final String createdAt;
  final String finishedAt;
  final String scheduleCloseTime;
  final bool isOpen;

  const Roll(
      {required this.rowId,
      required this.longitude,
      required this.latitude,
      required this.classCode,
      required this.createdAt,
      required this.finishedAt,
      this.scheduleCloseTime = '',
      this.isOpen = false});

  factory Roll.fromJson(Map<String, dynamic> json) {
    return Roll(
        rowId: json['id'],
        longitude: json['longitude'],
        latitude: json['latitude'],
        classCode: json['classCode'],
        createdAt: json['createdAt'],
        finishedAt: json['finishedAt'],
        scheduleCloseTime: json['scheduleCloseTime'],
        isOpen: json['isOpen']);
  }
}
