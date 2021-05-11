import 'dart:convert';
import 'package:bookspace/models/user.dart';

Mention mentionFromJson(String str) => Mention.fromJson(json.decode(str));

String mentionToJson(Mention data) => json.encode(data.toJson());

class Mention {
  int id;
  User author;
  String type;
  DateTime dop;
  String content;
  String mentionUri;

  Mention({
    this.id,
    this.author,
    this.type,
    this.dop,
    this.content,
    this.mentionUri
  });

  factory Mention.fromJson(Map<String, dynamic> json) => Mention(
        id: json['id'],
        author: User.fromJson(json['author']),
        type: json['type'],
        dop: DateTime.parse(json['dop']),
        content: json['content'],
        mentionUri: json['mentionUri']
      );

  Map<String, dynamic> toJson() => {
        'author': author,
        'type': type,
        'dop': dop,
        'content': content, 
      };
}
