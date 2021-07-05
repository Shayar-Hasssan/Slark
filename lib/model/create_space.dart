import 'dart:convert';

import 'package:slark/model/file.dart';
import 'package:slark/model/workspace.dart';

CreateSpace createSpaceFromJson(String str) =>
    CreateSpace.fromJson(json.decode(str));

String createSpaceToJson(CreateSpace data) => json.encode(data.toJson());

class CreateSpace {
  CreateSpace({
    this.id,
    this.workspace,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.image,
  });

  String id;
  Workspace workspace;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  Files image;

  factory CreateSpace.fromJson(Map<String, dynamic> json) => CreateSpace(
        id: json["_id"],
        workspace: json["_workspace"] == null
            ? null
            : Workspace.fromJson(json["_workspace"]),
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
        image: json["image"] == null ? null : Files.fromJson(json["image"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_workspace": workspace == null ? null : workspace.toJson(),
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
        "image": image == null ? null : image.toJson(),
      };
}
