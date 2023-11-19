import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/schedule.dart';

class ScheduleService {
  final Uri _endpoint = Uri.parse('http://localhost:8443/schedule/create-schedule/');

  Future<bool> createSchedule(Schedule schedule) async {
    var response = await http.post(
      _endpoint,
      body: json.encode(schedule.toJson()),
      headers: {"Content-Type": "application/json"},
    );
    return response.statusCode == 200;
  }
}