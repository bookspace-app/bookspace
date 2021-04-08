import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:bookspace/config.dart';
import 'package:bookspace/models/user.dart';
import 'package:http/http.dart' as http;

class UserController {
  // GET user by ID
  static Future<User> getUser(int id) async {
    User user;
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
    } catch (e) {
      print('error caught: $e');
    }
    return user;
  }

  // GET ALL users
  static Future<List<User>> getAllusers() async {
    List<User> users = [];
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users");

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
        json.decode(response.body).forEach((result) {
          users.add(User.fromJson(result));
        });
      }
    } catch (e) {
      print('error caught: $e');
    }
    return users;
  }

  //POST user
  static Future<User> postUser(
    String username,
    String name,
    String email,
    String pass
  ) async {
    User user;

    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users");

      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      //Define body
      Map<String, String> body = {
        'username': username,
        'name': name,
        'email': email,
        'password': pass,
        'description': "testDescripcion",
        'dob': DateFormat('yyyy-mm-dd').format(DateTime.now()),
        'rank': "WORKER",
      };

      // Make POST request
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(body));

      // Request status and body
      int statusCode = response.statusCode;
      String requestBody = response.body;

      print('Response status: $statusCode\n Response body: $requestBody\n');
      if (statusCode == 201) {
        user = User.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print('error caught: $e');
    }
    return null;
  }

  //UPDATE USER
  static Future<bool> updateUser(String username, String name, String email,
      String descripcion, int id /*String password*/) async {
    User user;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id");

      //define headers
      Map<String, String> headers = {
        //"Authorization": "JWT $authToken",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      //Define body
      Map<String, String> body = {
        'username': username,
        'name': name,
        'email': email,
        //'password': password,
        'description': descripcion,
      };

      // Make POST request
      http.Response response =
          await http.put(uri, headers: headers, body: json.encode(body));

      print("HOLIIIII" + response.body.toString());

      int statusCode = response.statusCode;

      //return response.statusCode == 200;
      if (statusCode == 201) {
        user = User.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print('error caught: $e');
    }
    return false;
  }

  //UPDATE USER DESCRIPTION
  static Future<bool> updateDesc (String descripcion, int id ) async {
    User user;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id");

      //define headers
      Map<String, String> headers = {
        //"Authorization": "JWT $authToken",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      //Define body
      Map<String, String> body = {
        'description': descripcion,
      };

      // Make PUT request
      http.Response response =
      await http.put(uri, headers: headers, body: json.encode(body));

      // Request status and body
      int statusCode = response.statusCode;
      String requestBody = response.body;

      print('Response status: $statusCode\n Response body: $requestBody\n');

      if (statusCode == 201) {
        user = User.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print('error caught: $e');
    }
    return false;
  }
}
