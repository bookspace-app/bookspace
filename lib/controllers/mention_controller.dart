import 'dart:convert';

import 'package:bookspace/config.dart';
import 'package:bookspace/models/mention.dart';

import 'package:http/http.dart' as http;

class MentionController {

  // Get mentions by user ID
  static Future<List<Mention>> getMentionsbyUserId(int id) async {
    List<Mention> mentions = [];
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/users/$id/mentions");
      
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

      //print('Response status: $statusCode\n Response body: $requestBody\n');
      if (statusCode == 200) {
        json.decode(utf8.decode(response.bodyBytes)).forEach((result) {
          mentions.add(Mention.fromJson(result));
        });
      }
    } catch(e) {
      print('error caught: $e');
    }
    return mentions;
  }
}
