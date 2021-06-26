// To parse this JSON data, do
//
//     final listt = listtFromJson(jsonString);

import 'dart:convert';

import 'package:slark/model/task.dart';

Listt listtFromJson(String str) => Listt.fromJson(json.decode(str));

String listtToJson(Listt data) => json.encode(data.toJson());

class Listt {
  Listt({
    this.list,
    this.message,
    this.code,
  });

  ListClass list;
  String message;
  int code;

  factory Listt.fromJson(Map<String, dynamic> json) => Listt(
        list: ListClass.fromJson(json["list"]),
        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "list": list.toJson(),
        "message": message,
        "code": code,
      };
}

class ListClass {
  ListClass({
    this.tasks,
    this.id,
    this.name,
    this.space,
    this.v,
  });

  List<Task> tasks;
  String id;
  String name;
  String space;
  int v;

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        tasks: List<Task>.from(json["_tasks"].map((x) => x)),
        id: json["_id"],
        name: json["name"],
        space: json["_space"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_tasks": List<Task>.from(tasks.map((x) => x)),
        "_id": id,
        "name": name,
        "_space": space,
        "__v": v,
      };
}
