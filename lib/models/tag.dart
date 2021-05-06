import 'dart:convert';
import 'package:bookspace/models/user.dart';

Tag publicationFromJson(String str) => Tag.fromJson(json.decode(str));

String publicationToJson(Tag data) => json.encode(data.toJson());

class Tag {
  String self;
  int id;
  String name;
  User author;

  Tag({this.self, this.id, this.name, this.author});

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
      id: json["id"],
      name: json["name"],
      self: json["self"],
      author: json["author"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "self": self,
        "name": name,
        "author": author,
      };
}
