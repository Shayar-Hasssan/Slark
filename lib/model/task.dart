// To parse this JSON data, do
//
//     final task = taskFromJson(jsonString);

import 'dart:convert';

Task taskFromJson(String str) => Task.fromJson(json.decode(str));

String taskToJson(Task data) => json.encode(data.toJson());

class Task {
  Task({
    this.task,
    this.message,
    this.code,
  });

  TaskClass task;
  String message;
  int code;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        task: TaskClass.fromJson(json["task"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "task": task.toJson(),
        "message": message,
        "code": code,
      };
}

class TaskClass {
  TaskClass({
    this.constraints,
    this.comments,
    this.tags,
    this.attachment,
    this.assignedUsers,
    this.id,
    this.name,
    this.list,
    this.priority,
    this.v,
  });

  List<dynamic> constraints;
  List<dynamic> comments;
  List<dynamic> tags;
  List<dynamic> attachment;
  List<dynamic> assignedUsers;
  String id;
  String name;
  String list;
  String priority;
  int v;

  factory TaskClass.fromJson(Map<String, dynamic> json) => TaskClass(
        constraints: List<dynamic>.from(json["constraints"].map((x) => x)),
        comments: List<dynamic>.from(json["comments"].map((x) => x)),
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        attachment: List<dynamic>.from(json["attachment"].map((x) => x)),
        assignedUsers: List<dynamic>.from(json["_assignedUsers"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        list: json["_list"],
        priority: json["priority"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "constraints": List<dynamic>.from(constraints.map((x) => x)),
        "comments": List<dynamic>.from(comments.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "attachment": List<dynamic>.from(attachment.map((x) => x)),
        "_assignedUsers": List<dynamic>.from(assignedUsers.map((x) => x)),
        "_id": id,
        "name": name,
        "_list": list,
        "priority": priority,
        "__v": v,
      };
}
