import 'dart:convert';

import 'package:exercitar_0/src/core/api_constants.dart';
import 'package:http/http.dart';

class SignUpService {
  final Client _client;

  SignUpService({required Client client}) : _client = client;
  Future<Map<String, dynamic>> signUp(
      {required String username,
      required String email,
      required String password}) async {
    final Response response = await _client.post(
        Uri.parse('${ApiConstants.baseUrl}/signUp'),
        headers: ApiConstants.headers,
        body: {
          'username': username,
          'email': email,
          'password': password,
        });

    if (response.statusCode == 200) {
      return Map.from(jsonDecode(response.body)['result']);
    } else {
      throw jsonDecode(response.body)['error'];
    }
  }
}
