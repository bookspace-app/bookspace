import 'dart:convert';
import 'dart:io';
import 'package:bookspace/globals.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/models/tag.dart';
import 'package:intl/intl.dart';
import 'package:bookspace/config.dart';
import 'package:bookspace/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http_parser/http_parser.dart';

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
      if (statusCode == 200 || statusCode == 201) {
        user = User.fromJson(json.decode(response.body));
      }
    } catch (e) {
      print('error caught: $e');
    }
    return user;
  }

  //UPDATE USER
  static Future<bool> updateUser(String username, String name, String email,
      String descripcion, int id, String token) async {
    User user;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id");

      //define headers
      Map<String, String> headers = {
        //"Authorization": "JWT $authToken",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'auth': token,
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
        'auth': 'AUTH',
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
        categories = tagsJson != null ? List.from(tagsJson) : null;

        /*Map map = jsonDecode(response.body);
        categories = map["favCategories"];*/
      }
    } catch (e) {
      print('error caught: $e');
    }
    return categories;
  }

  //UPDATE USER CATEGORIES
  static Future<bool> updateCategories(
      List<String> cat, int id, String token) async {
    List<String> category;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id");

      //define headers
      Map<String, String> headers = {
        //"Authorization": "JWT $authToken",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'auth': token,
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
      String email, String password) async {
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/login");

      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      //Define body
      Map<String, String> body = {
        'email': email,
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

//Get user email
  static Future<User> getMail(String email) async {
    User user;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/email/$email");

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

  //get token usuario
  static Future<Map<String, dynamic>> gettoken(int id) async {
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/token/$id");

      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Make POST request
      http.Response response = await http.get(uri, headers: headers);

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

  static Future<String> postProfilePic(
      String filename, File _image, int id) async {
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id/profilePic");
    String url = "https://bookspace-app.herokuapp.com$API/users/$id/profilePic";

    // open a byteStream
    var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));
    // get file length
    var length = await _image.length();

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file.. here this "image_file" is a key of the API request
    var multipartFile = new http.MultipartFile('profilePic', stream, length,
        filename: basename(_image.path));

    // add file to multipart
    request.files.add(multipartFile);

    // send request to upload image
    await request.send().then((response) async {
      // listen for response
      response.stream.transform(utf8.decoder).listen((value) {
        print(value);
      });
    }).catchError((e) {
      print(e);
    });

    return "xd";
  }

  // GET profile PHOTO
  static Future<String> getProfilePic(int id) async {
    String path;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id/profilePicPath");

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
        path = response.body;
        print(path);
      }
    } catch (e) {
      print('error caught: $e');
    }
    return path;
  }

  // Delete PROFILE PIC by id
  static Future<int> deleteProfilePic(int id) async {
    Publication publication;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id/profilePic");

      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };

      // Make GET request
      http.Response response = await http.delete(uri, headers: headers);

      // Request status and body
      int statusCode = response.statusCode;

      print('Delete response status: $statusCode\n');
      return statusCode;
    } catch (e) {
      print('error caught: $e');
    }
    return null;
  }


  static Future<Map<String, dynamic>> loginGoogle() async {
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "oauth2/authorization/google");

      // Make POST request
      http.Response response = await http.post(uri);

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

  //Reportar publicacion
  static Future<int> report(int Uid, int Pid, String token) async {
    try {
      Uri uri = Uri.https(
          BACKEND_AUTHORITY, "$API/users/$Uid/reportPublication/$Pid");

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
        return statusCode;
      }
    } catch (e) {
      print('error caught: $e');
    }
    return -1;
  }

  //RECUPERAR CONTRASEÑA
  static Future<bool> recupera(String email) async {
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/forgotPassword");

      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      //Define body
      Map<String, String> body = {
        'email': email,
      };
      // Make POST request
      http.Response response =
          await http.post(uri, headers: headers, body: jsonEncode(body));

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
}
