import 'dart:convert';

import 'package:flutter_app/model/Student.dart';
import 'package:flutter_app/services/constants.dart';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'Content-type': 'application/json; charset=utf-8',
  'Accept': 'application/json',
};

Future<List<Student>> getStudentsByClass(String classCode) async {
  final response = await http.get(
      Uri.parse(
          "$baseApiUrl/students/enrolled-class?codeClass=$classCode&semester=2023.1"),
      headers: requestHeaders);

  if (response.statusCode == 200) {
    List<dynamic> jsonList =
        json.decode(utf8.decode(response.bodyBytes))["classmates"];
    return jsonList.map((json) => Student.fromJson(json)).toList();
  } else if (response.statusCode == 404) {
    return [];
  } else {
    throw Exception("Failed trying to fetch user classes");
  }
}
