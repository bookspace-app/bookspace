import 'dart:convert';

import 'package:bookspace/config.dart';
import 'package:bookspace/models/publication.dart';
import 'package:bookspace/models/user.dart';
import 'package:http/http.dart' as http;

class PublicationController {
  // Get publication by ID
  static Future<Publication> getPublication(int id) async {
    Publication publication;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/publications/$id");

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
        final data = jsonDecode(response.body) as Map;
        /*for (String name in data.keys){
          final value = data[name];
          print('[$name:$value]'); 
        }
        print("\n");*/
        publication =
            Publication.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      }
    } catch (e) {
      print('error caught: $e');
    }
    return publication;
  }

  // Get ALL publications or get publications of a specific user (specify URI)
  static Future<List<Publication>> getPublications([String URI]) async {
    List<Publication> publications = [];
    try {
      Uri uri = Uri.https(
          BACKEND_AUTHORITY,
          (URI == null)
              ? "$API/publications"
              : RegExp(r"(?<=.com).*$").stringMatch(URI).toString());

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
          /*for (String name in result.keys){
            final value = result[name];
            print('[$name:$value]'); 
          }
          print("\n");*/

          publications.add(Publication.fromJson(result));
        });
      }
    } catch (e) {
      print('error caught: $e');
    }
    return publications;
  }

  // POST publications
  static Future<int> createPublication(Publication publication) async {
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/publications");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      Map<String, dynamic> publicationMap = publication.toJson();
      var body = json.encode(publicationMap);

      // Make POST request
      http.Response response =
          await http.post(uri, headers: headers, body: body);

      //print('Create publication response code: ${response.statusCode}: ${response.body}\n');

      if (response.statusCode == 200) {
        return int.parse(response.body);
      }
    } catch (e) {
      print('error caught: $e');
    }

    return null;
  }

  //update publiction
  static Future<bool> editPublication(Publication publication, int id) async {
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/publications/$id");
    try {
      //define headers
      Map<String, String> headers = {
        //"Authorization": "JWT $authToken",
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      //Define body
      Map<String, dynamic> publicationMap = publication.toJson();
      var body = json.encode(publicationMap);

      // Make PUT request
      http.Response response =
          await http.put(uri, headers: headers, body: body);

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

  // Delete publication by id
  static Future<int> deletePublication(int id) async {
    Publication publication;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/publications/$id");

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

  //likes
  static Future<int> like(int Pid, int Uid) async {
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/publications/$Pid/like/$Uid");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Make POST request
      http.Response response = await http.post(uri, headers: headers);

      //print('Create publication response code: ${response.statusCode}: ${response.body}\n');

      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      print('error caught: $e');
    }
    return null;
  }

  //Delete de like
  static Future<int> unlike(int Pid, int Uid) async {
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/publications/$Pid/like/$Uid");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Make POST request
      http.Response response = await http.delete(uri, headers: headers);

      //print('Create publication response code: ${response.statusCode}: ${response.body}\n');

      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      print('error caught: $e');
    }
    return null;
  }

  //dislikes
  static Future<int> dislike(int Pid, int Uid) async {
    Uri uri =
        Uri.https(BACKEND_AUTHORITY, "$API/publications/$Pid/dislike/$Uid");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Make POST request
      http.Response response = await http.post(uri, headers: headers);

      //print('Create publication response code: ${response.statusCode}: ${response.body}\n');

      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      print('error caught: $e');
    }
    return null;
  }

  //Delete de dislike
  static Future<int> undislike(int Pid, int Uid) async {
    Uri uri =
        Uri.https(BACKEND_AUTHORITY, "$API/publications/$Pid/dislike/$Uid");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Make POST request
      http.Response response = await http.delete(uri, headers: headers);

      //print('Create publication response code: ${response.statusCode}: ${response.body}\n');

      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      print('error caught: $e');
    }
    return null;
  }

  //Post a favoritos
  static Future<int> fav(int Pid, int Uid) async {
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/publications/$Pid/fav/$Uid");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Make POST request
      http.Response response = await http.post(uri, headers: headers);

      //print('Create publication response code: ${response.statusCode}: ${response.body}\n');

      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      print('error caught: $e');
    }
    return null;
  }

  //Delete de favoritos
  static Future<int> delfav(int Pid, int Uid) async {
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/publications/$Pid/fav/$Uid");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      // Make POST request
      http.Response response = await http.delete(uri, headers: headers);

      //print('Create publication response code: ${response.statusCode}: ${response.body}\n');

      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      print('error caught: $e');
    }
    return null;
  }

  //get favourites users
  static Future<List<User>> getfav(int Pid) async {
    List<User> users = [];
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/publications/$Pid/fav");

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
}
