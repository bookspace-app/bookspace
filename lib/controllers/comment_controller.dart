import 'dart:convert';

import 'package:bookspace/config.dart';
import 'package:bookspace/models/comment.dart';
import 'package:http/http.dart' as http;

class CommentController {
  // Get comment by ID
  static Future<Comment> getComment(int id) async {
    Comment comment;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/comments/$id");

      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      };

      // Make GET request
      http.Response response = await http.get(uri, headers: headers);

      // Request status and body
      int statusCode = response.statusCode;

      if (statusCode == 200) {
        final data = jsonDecode(response.body) as Map;
        /*for (String name in data.keys){
          final value = data[name];
          print('[$name:$value]'); 
        }
        print("\n");*/
        comment =
            Comment.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      }
    } catch (e) {
      print('error caught: $e');
    }
    return comment;
  }

  // Get ALL comments or get comments of a specific publication (specify URI)
  static Future<List<Comment>> getComments([String URI]) async {
    List<Comment> comments = [];
    try {
      Uri uri = Uri.https(
          BACKEND_AUTHORITY,
          (URI == null)
              ? "$API/comments"
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
      String responseBody = response.body;

      //print('Response status: $statusCode\n Response body: $responseBody\n');
      if (statusCode == 200) {
        json.decode(utf8.decode(response.bodyBytes)).forEach((result) {
          /*for (String name in result.keys){
            final value = result[name];
            print('[$name:$value]'); 
          }
          print("\n");*/

          comments.add(Comment.fromJson(result));
        });
      }
    } catch (e) {
      print('error caught: $e');
    }
    return comments;
  }

  // POST comments

  static Future<bool> createComment(Comment comment, String token) async {
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/comments");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'auth': token,
      };

      Map<String, dynamic> commentMap = comment.toJson();
      var body = json.encode(commentMap);

      // Make POST request
      http.Response response =
          await http.post(uri, headers: headers, body: body);

      /*print('Create comment response code: ${response.statusCode}: ${response.body}\n');*/

      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      print('error caught: $e');
    }
    return false;
  }

  // Delete comment by id
  static Future<int> deleteComment(int id, String token) async {
    Comment comment;
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/comments/$id");

      // Define headers
      Map<String, String> headers = {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'auth': token,
      };

      // Make DELETE request
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
  static Future<int> like(int Pid, int Uid, String token) async {
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/comments/$Pid/like/$Uid");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'auth': token,
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

  //dislikes
  static Future<int> dislike(int Pid, int Uid, String token) async {
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/comments/$Pid/dislike/$Uid");

    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'auth': token,
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
}
