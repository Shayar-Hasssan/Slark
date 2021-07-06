import 'dart:convert';

CreateTask createtaskFromJson(String str) =>
    CreateTask.fromJson(json.decode(str));

String createtaskToJson(CreateTask data) => json.encode(data.toJson());

class CreateTask {
  CreateTask({
    this.assets,
    this.assignedUsers,
    this.subtasks,
    this.comments,
    this.id,
    this.name,
    this.list,
    this.priority,
    this.v,
  });

  List<dynamic> assets;
  List<dynamic> assignedUsers;
  List<dynamic> subtasks;
  List<dynamic> comments;
  String id;
  String name;
  String list;
  int priority;
  int v;

  factory CreateTask.fromJson(Map<String, dynamic> json) => CreateTask(
        assets: json["assets"] == null
            ? null
            : List<dynamic>.from(json["assets"].map((x) => x)),
        assignedUsers: json["_assignedUsers"] == null
            ? null
            : List<dynamic>.from(json["_assignedUsers"].map((x) => x)),
        subtasks: json["_subtasks"] == null
            ? null
            : List<dynamic>.from(json["_subtasks"].map((x) => x)),
        comments: json["comments"] == null
            ? null
            : List<dynamic>.from(json["comments"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        list: json["_list"],
        priority: json["priority"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "assets": List<dynamic>.from(assets.map((x) => x)),
        "_assignedUsers": List<dynamic>.from(assignedUsers.map((x) => x)),
        "_subtasks": List<dynamic>.from(subtasks.map((x) => x)),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "_id": id,
        "name": name,
        "_list": list,
        "priority": priority,
        "__v": v,
      };
}
