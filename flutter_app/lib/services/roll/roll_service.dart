import 'dart:convert';

import 'package:flutter_app/model/HistoryRoll.dart';
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
  final response = await http.patch(
      Uri.parse("$baseApiUrl/roll/close-roll?callId=$rollId"),
      headers: requestHeaders);

  return response;
}

Future<List<HistoryRoll>> getClassHistoric(String classCode) async {
  final response = await http.get(
      Uri.parse(
          "$baseApiUrl/roll/rolls-historic/?classCode=$classCode&semester=2023.1"),
      headers: requestHeaders);

  if (response.statusCode == 200) {
    List<dynamic> jsonList =
        json.decode(utf8.decode(response.bodyBytes))["rolls"];
    return jsonList.map((json) => HistoryRoll.fromJson(json)).toList();
  } else if (response.statusCode == 404) {
    return [];
  } else {
    throw Exception("Failed trying to fetch user classes");
  }
}
