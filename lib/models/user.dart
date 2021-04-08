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
  DateTime dob;
  
  String myPublicationsUri;
  String votedPublicationsUri;
  String favouritePublicationsUri;
  String myCommentsUri;
  String votedCommentsUri;
  String blockedUsersUri;
  String profilePicUri;
  String myTagsUri;
  String myPreferedTagsUri;

  User({
    this.id,
    this.email,
    this.name,
    this.username,
    this.age,
    this.description,
    this.rank,
    this.dob,
    
    this.myPublicationsUri,
    this.votedPublicationsUri,
    this.favouritePublicationsUri,
    this.myCommentsUri,
    this.votedCommentsUri,
    this.blockedUsersUri,
    this.profilePicUri,
    this.myTagsUri,
    this.myPreferedTagsUri,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        username: json["username"],
        age: json["int"],
        description: json["description"],
        rank: int.tryParse(json["rank"]),
        dob: DateTime.parse(json["dob"]),
    
        myPublicationsUri: json["publications"],
        votedCommentsUri: json["votedPublications"],
        favouritePublicationsUri: json["favouritePublications"],
        myCommentsUri: json["comments"],
        votedPublicationsUri: json["votedComments"],
        blockedUsersUri: json["blockedUsers"],
        profilePicUri: json["profilePic"],
        myTagsUri: json["createdTags"],
        myPreferedTagsUri: json["preferedTags"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "name": name,
        "username": username,
        "age": age,
        "description": description,
        "rank": rank,
        "dob": dob,
      };
}