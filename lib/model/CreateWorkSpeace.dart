import 'dart:convert';

// ignore: non_constant_identifier_names
CreateWorkspace CreateworkspaceFromJson(String str) =>
    CreateWorkspace.fromJson(json.decode(str));

// ignore: non_constant_identifier_names
String CreateworkspaceToJson(CreateWorkspace data) =>
    json.encode(data.toJson());

class CreateWorkspace {
  CreateWorkspace({
    this.message,
    this.id,
    this.name,
    this.code,
  });

  String message;
  String name;
  String id;
  int code;

  factory CreateWorkspace.fromJson(Map<String, dynamic> json) =>
      CreateWorkspace(
        message: json["message"],
        name: json["name"],
        id: json["id"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "id": message,
        "name": message,
        "code": code,
      };
}
