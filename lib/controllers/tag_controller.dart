import 'dart:convert';

import 'package:bookspace/config.dart';
import 'package:bookspace/models/tag.dart';
import 'package:http/http.dart' as http;

class TagController {
  
  //GET ALL tags
  static Future<List<Tag>> getAllTags() async {
    List<Tag> tags = [];
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/tags");
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
          tags.add(Tag.fromJson(result));
        });
      }
    } catch (e) {
      print('error caught: $e');
    }
    return tags;
  }

  // POST tag
  static Future<int> createTag(Tag tag) async {    
    
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/tags");

    try{
      Map<String,String> headers = {
        'Content-Type' : 'application/json', 
        'Accept': 'application/json',
      };

      Map<String, dynamic> tagMap =  tag.toJson();
      var body = json.encode(tagMap);

      // Make POST request
      http.Response response = await http.post(uri, headers: headers, body: body);
      
      //print('Create tag response code: ${response.statusCode}: ${response.body}\n');

      if (response.statusCode == 200) {
        return int.parse(response.body);
      }  
    } catch(e) {
      print('error caught: $e');
    }
    
    return null;
  } 

}