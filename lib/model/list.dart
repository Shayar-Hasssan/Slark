import 'dart:convert';

import 'package:slark/model/space.dart';

Listt listtFromJson(String str) => Listt.fromJson(json.decode(str));

String listtToJson(Listt data) => json.encode(data.toJson());

// List<Listt> listFromJson(String str) =>
//     List<Listt>.from(json.decode(str).map((x) => Listt.fromJson(x)));

// String listToJson(List<Listt> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Listt {
  Listt({
    this.id,
    this.name,
    this.space,
    this.v,
  });

  String id;
  String name;
  Space space;
  int v;

  factory Listt.fromJson(Map<String, dynamic> json) => Listt(
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
        space: json["_space"] == null ? null : Space.fromJson(json["_space"]),
        v: json["__v"] == null ? null : json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "_space": space.toJson(),
        "__v": v,
      };
}
