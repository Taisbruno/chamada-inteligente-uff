import 'dart:convert';

import 'package:flutter_app/model/Class.dart';
import 'package:flutter_app/services/constants.dart';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'Content-type': 'application/json; charset=utf-8',
  'Accept': 'application/json',
};

Future<List<Class>> getClassesByRegistration(String registration) async {
  final response = await http.get(
      Uri.parse("$baseApiUrl/class/classes?registration=$registration"),
      headers: requestHeaders);

  if (response.statusCode == 200) {
    List<dynamic> jsonList =
        json.decode(utf8.decode(response.bodyBytes))["classrooms"];
    return jsonList.map((json) => Class.fromJson(json)).toList();
  } else if (response.statusCode == 404) {
    return [];
  } else {
    throw Exception("Failed trying to fetch user classes");
  }
}
