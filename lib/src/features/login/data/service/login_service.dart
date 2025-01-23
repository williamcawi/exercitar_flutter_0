import 'dart:convert';

import 'package:exercitar_0/src/core/api_constants.dart';
import 'package:http/http.dart';

class LoginService {
  final Client _client;

  LoginService({required Client client}) : _client = client;

  Future<Map<String, dynamic>> login(
      {required String usernameOrEmail, required String password}) async {
    final Response response = await _client.post(
        Uri.parse('${ApiConstants.baseUrl}/login'),
        headers: ApiConstants.headers,
        body: {'usernameOrEmail': usernameOrEmail, 'password': password});

    if (response.statusCode == 200) {
      return Map<String, dynamic>.from(jsonDecode(response.body)['result']);
    } else {
      throw jsonDecode(response.body)['error'];
    }
  }
}
