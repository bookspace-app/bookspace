import 'dart:convert';
import 'package:bookspace/models/chat.dart';
import 'package:bookspace/models/user.dart';

Message messageFromJson(String str) => Message.fromJson(json.decode(str));

String messageToJson(Message data) => json.encode(data.toJson());

class Message {
  int id;
  Chat parent;
  String content;
  DateTime creationDate;
  User author;

  Message({
    this.id,
    this.parent,
    this.content,
    this.creationDate,
    this.author,
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        id: json["id"],
        parent: json["parent"],
        content: json["content"],
        creationDate: DateTime.parse(json["creationDate"]),
        author: User.fromJson(json["author"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "parent": parent,
        "content": content,
        "creationDate": creationDate,
        "author": author,
      };
}

