import 'dart:convert';
import 'package:bookspace/models/user.dart';
import 'package:intl/intl.dart';

Publication publicationFromJson(String str) => Publication.fromJson(json.decode(str));

String publicationToJson(Publication data) => json.encode(data.toJson());

enum Category { ACTION, LOVE, WAR, POTENTIAL }

extension CategoryExtension on Category {
  int get category {
    switch (this) {
      case Category.ACTION:
        return 0;
      case Category.LOVE:
        return 1;
      case Category.WAR:
        return 2;
      case Category.POTENTIAL:
        return 3;
      default:
        return null;
    }
  }
}

class Publication {
  int id;
  String title;
  String content;
  DateTime dop; // date of publication
  User author;

  //List<String> votedBy;
  //List<String> favoriteBy;
  //List<String> comments;
  //int category;


  Publication({
    this.id,
    this.title,
    this.content,
    this.dop,
    this.author,
    //this.votedBy,
    //this.favoriteBy,
    //this.comments,
    //this.category,
  });

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        dop: DateTime.parse(json["dop"]),
        author: User.fromJson(json["author"]),
        //description: json["description"],
        //category: int.tryParse(json["category"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "dop": dop,
        "author": author,
        //"category": category,
      };
}

