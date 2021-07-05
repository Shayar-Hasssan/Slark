import 'dart:convert';

List<AllSpace> allSpaceFromJson(String str) =>
    List<AllSpace>.from(json.decode(str).map((x) => AllSpace.fromJson(x)));

String allSpaceToJson(List<AllSpace> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllSpace {
  AllSpace({
    this.id,
    this.workspace,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String workspace;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory AllSpace.fromJson(Map<String, dynamic> json) => AllSpace(
        id: json["_id"],
        workspace: json["_workspace"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "_workspace": workspace,
        "name": name,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
