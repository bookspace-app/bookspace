import 'dart:convert';
import 'package:intl/intl.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

/*List<String> fromJsonCategories(String str) =>
    fromJsonCategories(json.decode(str));*/

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
  // INPUT
  String email;
  String name;
  String username;
  String password;
  DateTime dob;
  String description;
  List<String> favCategories;

  // OUTPUT
  int id;
  int age;
  DateTime dor; // date of register
  //int rank;;
  String rank;

  // URIs
  String myPublicationsUri;
  String likedPublicationsUri;
  String dislikedPublicationsUri;
  String favPublicationsUri;
  String myCommentsUri;
  String likedCommentsUri;
  String dislikedCommentsUri;
  String blockedUsersUri;
  String profilePicUri;
  String myTagsUri;
  String favTagsUri;
  String favCategoriesUri;
  String myMentionsUri;

  User(
      {this.id,
      this.email,
      this.name,
      this.username,
      this.password,
      this.dob,
      this.description,
      this.favCategories,
      this.age,
      this.dor,
      this.rank,
      this.myPublicationsUri,
      this.likedCommentsUri,
      this.dislikedCommentsUri,
      this.favPublicationsUri,
      this.myCommentsUri,
      this.likedPublicationsUri,
      this.dislikedPublicationsUri,
      this.blockedUsersUri,
      this.profilePicUri,
      this.myTagsUri,
      this.favTagsUri,
      this.favCategoriesUri,
      this.myMentionsUri});

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        email: json["email"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        description: json["description"],
        age: json["age"],
        dor: DateTime.parse(json["dor"]),
        rank: (json["rank"]),
        //rank: int.tryParse(json["rank"]),
        myPublicationsUri: json["publicationsUri"],
        likedCommentsUri: json["likedCommentsUri"],
        dislikedCommentsUri: json["dislikedCommentsUri"],
        favPublicationsUri: json["favouritePublicationsUri"],
        myCommentsUri: json["commentsUri"],
        likedPublicationsUri: json["likedPublicationsUri"],
        dislikedPublicationsUri: json["dislikedPublicationsUri"],
        blockedUsersUri: json["blockedUsersUri"],
        profilePicUri: json["profilePicUri"],
        myTagsUri: json["createdTagsUri"],
        favTagsUri: json["favTagsUri"],
        favCategoriesUri: json["favCategoriesUri"],
        myMentionsUri: json["mentionsUri"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "name": name,
        "username": username,
        "description": description,
        "favCategories": favCategories,
        "dob": dob,
      };
}
