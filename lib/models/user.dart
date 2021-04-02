import 'dart:convert';
import 'package:intl/intl.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

enum Rank { WORKER, SOLDIER, HAREM, QUEEN }

extension RankExtension on Rank {
  int get rank {
    switch (this) {
      case Rank.WORKER:
        return 4;
      case Rank.SOLDIER:
        return 3;
      case Rank.HAREM:
        return 2;
      case Rank.QUEEN:
        return 1;
      default:
        return null;
    }
  }
}

class User {
  int id;
  String email;
  String name;
  String username;
  int age;
  String description;
  int rank;
  //String myPublicationsApi;
  //String votedPublicationApi;
  //String myCommentsApi;

  User({
    this.id,
    this.email,
    this.name,
    this.username,
    this.age,
    this.description,
    this.rank,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        username: json["username"],
        age: json["int"],
        description: json["description"],
        rank: int.tryParse(json["rank"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "username": username,
        "age": age,
        "description": description,
        "rank": rank,
      };
}