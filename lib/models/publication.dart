import 'dart:convert';
import 'package:bookspace/models/user.dart';
import 'package:intl/intl.dart';

Publication publicationFromJson(String str) => Publication.fromJson(json.decode(str));

String publicationToJson(Publication data) => json.encode(data.toJson());

enum Category { ACTION, LOVE, WAR, POTENTIAL }
/*
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
*/

class Publication {

  // INPUT
  String title;
  String content;
  DateTime dop; 
  int authorId;
  String category;
  List<int> tags;
  List<String> mentions;

  // OUTPUT
  int id;
  int likes;
  int dislikes;
  int views;
  int totalLikes;
  int comments;
  User author;

  // URIs
  String likedByUri;
  String dislikedByUri;
  String favByUri;
  String commentsUri;
  String tagsUri;
  String mentionsUri;

  //String votedUsersUri;  
  //String favUsersUri;

  Publication({
    this.id,
    this.title,
    this.content,
    this.dop,
    this.authorId,
    this.category,
    this.tags,
    this.mentions,
    this.likes,
    this.dislikes,
    this.views,
    this.totalLikes,
    this.comments,
    this.author,
    this.likedByUri,
    this.dislikedByUri,
    this.favByUri,
    this.commentsUri,
    this.tagsUri,
    this.mentionsUri
  });

  factory Publication.fromJson(Map<String, dynamic> json) => Publication(
        id: json["id"],
        title: json["title"],
        content: json["content"],
        dop: DateTime.parse(json["dop"]),
        category: json["category"],
        likes: json["likes"],
        dislikes: json["dislikes"],
        views: json["nviews"], // ESTO ESTA MAL EN EL BACK
        totalLikes: json["totalLikes"],
        comments: json["ncomments"],  // ESTO ESTA MAL EN EL BACK
        author: User.fromJson(json["author"]),
        likedByUri: json["likedByUri"],
        dislikedByUri: json["dislikedByUri"],
        favByUri: json["favByUri"],
        commentsUri: json["commentsUri"],
        tagsUri: json["tagsUri"],
        mentionsUri: json["mentionsUri"]
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "content": content,
        "authorId": authorId,
        "category": category,
        "tags": tags,
        "mentions": mentions,
      };
}

