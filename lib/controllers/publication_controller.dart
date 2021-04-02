import 'dart:convert';

import 'package:bookspace/config.dart';
import 'package:bookspace/models/publication.dart';
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
        publication = Publication.fromJson(json.decode(response.body));
      }
    } catch(e) {
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
        (URI == null) ? "$API/publications": RegExp(r"(?<=.com).*$").stringMatch(URI).toString()
      );
      
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
          publications.add(Publication.fromJson(result));
        });
      }
    } catch(e) {
      print('error caught: $e');
    }
    return publications;
  }

  // POST publications
  static Future<int> createPublication(Publication publication) async {    
    
    Uri uri = Uri.https(BACKEND_AUTHORITY, "$API/publications");

    try{
      Map<String,String> headers = {
        'Content-Type' : 'application/json', 
        'Accept': 'application/json',
      };

      Map<String, dynamic> publicationMap =  publication.toJson();
      var body = json.encode(publicationMap);

      // Make POST request
      http.Response response = await http.post(uri, headers: headers, body: body);
      
      print('Create publication response code: ${response.statusCode}: ${response.body}\n');

      if (response.statusCode == 200) {
        return int.parse(response.body);
      }  
    } catch(e) {
      print('error caught: $e');
    }
    
    return null;
  } 

  //


}