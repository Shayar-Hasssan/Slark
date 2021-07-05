import 'dart:convert';
import 'package:slark/model/file.dart';

Workspace workspaceFromJson(String str) => Workspace.fromJson(json.decode(str));

String workspaceToJson(Workspace data) => json.encode(data.toJson());

class Workspace {
  Workspace({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String name;
  Files image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Workspace.fromJson(Map<String, dynamic> json) => Workspace(
        id: json["_id"],
        name: json["name"],
        image: Files.fromJson(json["image"]),
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
