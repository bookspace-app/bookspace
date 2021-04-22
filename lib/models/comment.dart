import 'dart:convert';
import 'package:bookspace/models/user.dart';

Comment commentFromJson(String str) => Comment.fromJson(json.decode(str));

String commentToJson(Comment data) => json.encode(data.toJson());

class Comment {

  // INPUT
  String content;
  int authorId;
  int publicationId;
  int parentId;
  List<int> mentions;

  // OUTPUT
  int id;
  DateTime dop; 
  int likes;
  int dislikes;
  int totalLikes;
  int replies;
  User author;

  // URIs
  String likedByUri;
  String dislikedByUri;
  String repliesUri;
  String mentionsUri;

  //String votedUsersUri;  
  //String favUsersUri;

  Comment({
    this.id,
    this.content,
    this.authorId,
    this.publicationId,
    this.parentId,
    this.mentions,
    this.dop,
    this.likes,
    this.dislikes,
    this.totalLikes,
    this.replies,
    this.author,
    this.likedByUri,
    this.dislikedByUri,
    this.repliesUri,
    this.mentionsUri
  });

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        content: json["content"],
        dop: DateTime.parse(json["dop"]),
        likes: json["likes"],
        dislikes: json["dislikes"],
        totalLikes: json["totalLikes"],
        replies: json["nReplies"], 
        author: User.fromJson(json["author"]),
        likedByUri: json["likedByUri"],
        dislikedByUri: json["dislikedByUri"],
        repliesUri: json["answersUri"],
        mentionsUri: "",//json["mentionsUri"] <= Cambiar cuando este en el back TODO
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "authorId": authorId,
        "publicationId": publicationId,
        "parentId": parentId,
        "mentions": mentions,
      };
}
