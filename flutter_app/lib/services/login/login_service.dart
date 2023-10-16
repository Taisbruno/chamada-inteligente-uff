import 'dart:collection';
import 'dart:convert';

import 'package:flutter_app/services/constants.dart';
import 'package:http/http.dart' as http;

Map<String, String> requestHeaders = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

Future<http.Response> authenticate(String cpf, String password) async {
  final body = jsonEncode({'registration': cpf, 'password': password});

  final response = await http.post(Uri.parse("$baseApiUrl/login/auth"),
      body: body, headers: requestHeaders);

  return response;
}
