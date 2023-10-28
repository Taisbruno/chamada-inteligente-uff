import 'dart:convert';

import 'package:flutter_app/services/constants.dart';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

Future<http.Response> createRoll(
    String latitude, String longitude, String classCode) async {
  final body = jsonEncode(
      {'latitude': latitude, 'longitude': longitude, 'class_code': classCode});

  final response = await http.post(Uri.parse("$baseApiUrl/roll/create-roll/"),
      body: body, headers: requestHeaders);

  return response;
}

Future<http.Response> finishRoll(String rollId) async {
  final response = await http.put(
      Uri.parse("$baseApiUrl/roll/close-roll?callId=$rollId"),
      headers: requestHeaders);

  return response;
}
