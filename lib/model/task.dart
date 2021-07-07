import 'dart:convert';

import 'package:slark/model/create_list.dart';
import 'package:slark/model/file.dart';
// import 'package:slark/model/list.dart';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

List<Task> tasksFromJson(String str) =>
    List<Task>.from(json.decode(str).map((x) => Task.fromJson(x)));

String tasksToJson(List<Task> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Task {
  Task({
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

  List<Files> assets;
  List<dynamic> assignedUsers;
  List<dynamic> subtasks;
  List<dynamic> comments;
  String id;
  String name;
  Createlist list;
  int priority;
  int v;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        assets: json["assets"] == null
            ? null
            : List<Files>.from(json["assets"].map((x) => Files.fromJson(x))),
        assignedUsers: json["_assignedUsers"] == null
            ? null
            : List<dynamic>.from(json["_assignedUsers"].map((x) => x)),
        subtasks: json["_subtasks"] == null
            ? null
            : List<dynamic>.from(json["_subtasks"].map((x) => x)),
        comments: json["comments"] == null
            ? null
            : List<dynamic>.from(json["comments"].map((x) => x)),
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        list: json["_list"] == null ? null : Createlist.fromJson(json["_list"]),
        priority: json["priority"] == null ? null : json["priority"],
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "assets": List<dynamic>.from(assets.map((x) => x.toJson())),
        "_assignedUsers": List<dynamic>.from(assignedUsers.map((x) => x)),
        "_subtasks": List<dynamic>.from(subtasks.map((x) => x)),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "_id": id,
        "name": name,
        "_list": list.toJson(),
        "priority": priority,
        "__v": v,
      };
}
