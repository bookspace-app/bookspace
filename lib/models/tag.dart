import 'dart:convert';
import 'package:bookspace/models/user.dart';

Tag tagFromJson(String str) => Tag.fromJson(json.decode(str));

String tagToJson(Tag data) => json.encode(data.toJson());

class Tag{

  int id;
  String name;
  User author;
  int authorId;
  int publicationId;
  String publicactionsAppearUri;
  String usersUri;

  Tag({
    this.id,
    this.name,
    this.author,
    this.authorId,
    this.publicationId,
    this.publicactionsAppearUri,
    this.usersUri,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    name: json["name"],
    author: User.fromJson(json["author"]),
    publicactionsAppearUri: json["publications"],
    usersUri: json["users"],
  );

  Map<String, dynamic> toJson() => {
        "name": name,
        "authorId": authorId,
        "publication": publicationId,
      };
}

