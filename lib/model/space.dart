import 'dart:convert';

import 'package:slark/model/CreateWorkSpeace.dart';

Space spaceFromJson(String str) => Space.fromJson(json.decode(str));

String spaceToJson(Space data) => json.encode(data.toJson());

class Space {
  Space({
    this.id,
    this.workspace,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  CreateWorkspace workspace;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Space.fromJson(Map<String, dynamic> json) => Space(
        id: json["_id"],
        workspace: json["_workspace"] == null
            ? null
            : CreateWorkspace.fromJson(json["_workspace"]),
        name: json["name"],
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? null
            : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_workspace": workspace == null ? null : workspace.toJson(),
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
