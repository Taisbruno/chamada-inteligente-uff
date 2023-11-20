class Schedule {
  String classCode;
  int dayOfWeek;
  String startTime;
  String endTime;
  String longitude;
  String latitude;

  Schedule({
    required this.classCode,
    required this.dayOfWeek,
    required this.startTime,
    required this.endTime,
    required this.longitude,
    required this.latitude,
  });

  Map<String, dynamic> toJson() => {
        "classCode": classCode,
        "dayOfWeek": dayOfWeek,
        "startTime": startTime,
        "endTime": endTime,
        "longitude": longitude,
        "latitude": latitude,
      };
}