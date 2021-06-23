import 'dart:convert';

// import 'package:slark/model/user.dart';

Space spaceFromJson(String str) => Space.fromJson(json.decode(str));

String spaceToJson(Space data) => json.encode(data.toJson());

class Space {
  Space({
    this.message,
    this.space,
    this.code,
  });

  String message;
  SpaceClass space;
  int code;

  factory Space.fromJson(Map<String, dynamic> json) => Space(
        message: json["message"],
        space: SpaceClass.fromJson(json["space"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "space": space.toJson(),
        "code": code,
      };
}

class SpaceClass {
  SpaceClass({
    this.users,
    this.tasks,
    this.lists,
  });

  List<Users> users;
  List<dynamic> tasks;
  List<String> lists;

  factory SpaceClass.fromJson(Map<String, dynamic> json) => SpaceClass(
        users: List<Users>.from(json["_users"].map((x) => Users.fromJson(x))),
        tasks: List<dynamic>.from(json["_tasks"].map((x) => x)),
        lists: List<String>.from(json["_lists"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "_users": List<dynamic>.from(users.map((x) => x.toJson())),
        "_tasks": List<dynamic>.from(tasks.map((x) => x)),
        "_lists": List<dynamic>.from(lists.map((x) => x)),
      };
}

class Users {
  Users({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
      };
}
