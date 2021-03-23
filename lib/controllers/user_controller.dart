

import 'dart:convert';

import 'package:bookspace/config.dart';
import 'package:bookspace/models/user.dart';
import 'package:http/http.dart' as http;

class UserController {

  static Future<User> getUser(int id) async {
    User user;
    print('Hola getuser');
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id");
      
      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Make GET request
      http.Response response = await http.get(uri, headers: headers);

      // Request status and body
      int statusCode = response.statusCode;
      String requestBody = response.body;

      print('Response status: $statusCode\n Response body: $requestBody\n');
      if (statusCode == 200) {
        user = User.fromJson(json.decode(response.body));
      }
    } catch(e) {
      print('error caught: $e');
    }
    return user;
  }

}