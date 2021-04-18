import 'dart:convert';
import 'package:bookspace/models/message.dart';
import 'package:bookspace/models/user.dart';

Chat chatFromJson(String str) => Chat.fromJson(json.decode(str));

String chatToJson(Chat data) => json.encode(data.toJson());

class Chat {
  int id;
  String title;
  String description;
  DateTime creationDate;
  List<User> participants;
  List<Message> messages;
  bool groupChat;

  Chat({
    this.id,
    this.title,
    this.description,
    this.creationDate,
    this.participants,
    this.messages,
    this.groupChat
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        creationDate: DateTime.parse(json["creationDate"]),
        participants: json["participants"],
        messages: json["messages"],
        groupChat: json["groupChat"]
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "creationDate": creationDate,
        "participants": participants,
        "messages": messages,
        "groupChat": groupChat
      };
}

