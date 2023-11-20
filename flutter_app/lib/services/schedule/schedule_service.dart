import 'package:flutter_app/model/Schedule.dart';
import 'package:flutter_app/services/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

class ScheduleService {
  Future<http.Response> createSchedule(Schedule schedule) async {
    var response = await http.post(
      Uri.parse("$baseApiUrl/schedule/create-schedule/"),
      body: json.encode(schedule.toJson()),
      headers: requestHeaders,
    );

    return response;
  }
}
