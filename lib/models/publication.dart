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
  int views;
  int likes;
  int category;
  User author;
  int author_id;
  String votedUsers;  
  String favUsers;
  String comments;
  String tags;
  int nComments;


  Publication({
    this.id,
    this.title,
    this.content,
    this.dop,
    this.views,
    this.likes,
    this.category,
    this.author,
    this.author_id,
    this.votedUsers,
    this.favUsers,
    this.comments,
    this.tags,
    this.nComments,
  });

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        dop: DateTime.parse(json["dop"]),
        views: json["views"],
        likes: json["likes"],
        category: int.tryParse(json["category"]),
        author: User.fromJson(json["author"]),
        author_id: json["author_id"],
        votedUsers: json["votedusers"],
        favUsers: json["favusers"],
        comments: json["comments"],
        tags: json["tags"],
        nComments: json["nComments"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "content": content,
        "dop": dop,
        "views": views,
        "likes": likes,
        "category": category,
        "author": author,
        "author_id": author_id,
        //"nComments": nComments,
      };
}

