import 'dart:convert';

import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/services/constants.dart';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

Future<http.Response> createPresence(String registration, String rollId) async {
  final body = jsonEncode({
    'studentRegistration': registration,
    'rollId': rollId,
    'message': 'Estava Presente'
  });

  final response = await http.post(
      Uri.parse("$baseApiUrl/presences/create-presence"),
      body: body,
      headers: requestHeaders);

  return response;
}

Future<List<Student>> getPresenceByRoll(String rollId) async {
  final response = await http.get(
      Uri.parse("$baseApiUrl/students/enrolled-roll?idRoll=$rollId"),
      headers: requestHeaders);

  if (response.statusCode == 200) {
    List<dynamic> jsonList =
        json.decode(utf8.decode(response.bodyBytes))["classmates"];
    return jsonList.map((json) => Student.fromJson(json)).toList();
  } else if (response.statusCode == 404) {
    return [];
  } else {
    throw Exception("Failed trying to fetch user presence");
  }
}
