import 'dart:convert';

CreateWorkspace createWorkspaceFromJson(String str) =>
    CreateWorkspace.fromJson(json.decode(str));

String createWorkspaceToJson(CreateWorkspace data) =>
    json.encode(data.toJson());

class CreateWorkspace {
  CreateWorkspace({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String name;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory CreateWorkspace.fromJson(Map<String, dynamic> json) =>
      CreateWorkspace(
        id: json["_id"],
        name: json["name"],
        image: json["image"] == null ? null : json["image"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
