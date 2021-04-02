import 'dart:convert';

import 'package:bookspace/config.dart';
import 'package:bookspace/models/publication.dart';
import 'package:http/http.dart' as http;

class PublicationController {

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
        publication = Publication.fromJson(json.decode(response.body));
      }
    } catch(e) {
      print('error caught: $e');
    }
    return publication;
  }

  static Future<List<Publication>> getPublications() async {
    List<Publication> publications = [];
    try {
      Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/publications");
      
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

      //print('Response status: $statusCode\n Response body: $requestBody\n');
      if (statusCode == 200) {
        json.decode(response.body).forEach((result) {
          publications.add(Publication.fromJson(result));
        });
      }
    } catch(e) {
      print('error caught: $e');
    }
    return publications;
  }

}