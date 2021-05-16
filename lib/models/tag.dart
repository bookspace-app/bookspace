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

  Tag({
    this.id,
    this.name,
    this.author,
    this.authorId,
    this.publicationId,
    this.publicactionsAppearUri,
  });

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
    id: json["id"],
    name: json["name"],
    author: User.fromJson(json["author"]),
    authorId: json["authorId"],
    publicationId: json["publication"],
    publicactionsAppearUri: json["publications"],
  );

  Map<String, dynamic> toJson() => {
        "name": name,
        "authorId": authorId,
        "publication": publicationId,
      };
}

