import 'dart:convert';
import 'package:bookspace/globals.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/models/tag.dart';
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

      /*print('Response status: $statusCode\n Response body: $requestBody\n');*/
      if (statusCode == 200) {
        final data = jsonDecode(response.body) as Map;
        /*for (String name in data.keys) {
          final value = data[name];
          print('[$name:$value]');
        }
        print("\n");*/
        user = User.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      }
    } catch (e) {
      print('error caught: $e');
    }
    return user;
  }

  // GET user by Username
  static Future<User> getUserByUsername(String username) async {
    User user;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/username/$username");

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
        final data = jsonDecode(response.body) as Map;
        /*for (String name in data.keys) {
          final value = data[name];
          print('[$name:$value]');
        }
        print("\n");*/
        user = User.fromJson(json.decode(utf8.decode(response.bodyBytes)));
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

      /*print('Response status: $statusCode\n Response body: $requestBody\n');*/
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
  static Future<User> postUser(String username, String name, String email,
      String pass, String dob) async {
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
        'dob': dob,
      };

      // Make POST request
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(body));

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

  //UPDATE USER
  static Future<bool> updateUser(String username, String name, String email,
      String descripcion, int id) async {
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
        'description': descripcion,
      };

      // Make POST request
      http.Response response =
          await http.put(uri, headers: headers, body: json.encode(body));

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
  static Future<bool> updateDesc(String descripcion, int id) async {
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

  // GET favorite categories by ID
  static Future<List<String>> getCategories(int id) async {
    List<String> categories;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id/categories");

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
        var tagsJson = jsonDecode(response.body);
        print(tagsJson);
        categories = tagsJson != null ? List.from(tagsJson) : null;
        print(categories);
        /*Map map = jsonDecode(response.body);
        categories = map["favCategories"];*/
      }
    } catch (e) {
      print('error caught: $e');
    }
    return categories;
  }

  //UPDATE USER CATEGORIES
  static Future<bool> updateCategories(List<String> cat, int id) async {
    List<String> category;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id");

      //define headers
      Map<String, String> headers = {
        //"Authorization": "JWT $authToken",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      //Define body
      Map<String, List<String>> body = {
        'favCategories': cat,
      };

      // Make PUT request
      http.Response response =
          await http.put(uri, headers: headers, body: json.encode(body));

      // Request status and body
      int statusCode = response.statusCode;
      String requestBody = response.body;

      print('Response status: $statusCode\n Response body: $requestBody\n');

      if (statusCode == 201) {
        category = json.decode(response.body);
      }
    } catch (e) {
      print('error caught: $e');
    }
    return true;
  }

  //login sesion
  static Future<Map<String, dynamic>> postlogin(
      String username, String password) async {
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/login");

      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      //Define body
      Map<String, String> body = {
        'email': username,
        'password': password,
      };

      // Make POST request
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(body));

      // Request status and body
      int statusCode = response.statusCode;
      Map<String, dynamic> requestBody = jsonDecode(response.body) as Map;

      print('Response status: $statusCode\n Response body: $requestBody\n');
      if (statusCode == 200) {
        return requestBody;
      }
    } catch (e) {
      print('error caught: $e');
    }
    return null;
  }

  //DELETE USER KEY (LOGOUT)
  static Future<bool> logout(int id, String token) async {
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id/logout");

      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'auth': token,
      };

      // Make POST request
      http.Response response = await http.post(uri, headers: headers);

      // Request status and body
      int statusCode = response.statusCode;
      String requestBody = response.body;

      print('Response status: $statusCode\n Response body: $requestBody\n');
      if (statusCode == 200) {
        return true;
      }
    } catch (e) {
      print('error caught: $e');
    }
    return false;
  }

  //get user favorite publications
  static Future<List<Publication>> getPublications(int id) async {
    List<Publication> publications = [];
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id/favPublications");

      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };

      // Make GET request
      http.Response response = await http.get(uri, headers: headers);

      // Request status and body
      int statusCode = response.statusCode;
      String requestBody = response.body;

      //print('Response status: $statusCode\n Response body: $requestBody\n');
      if (statusCode == 200) {
        json.decode(utf8.decode(response.bodyBytes)).forEach((result) {
          publications.add(Publication.fromJson(result));
        });
      }
    } catch (e) {
      print('error caught: $e');
    }
    return publications;
  }
}
