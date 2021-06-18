import 'dart:convert';

CreateSpace createSpaceFromJson(String str) =>
    CreateSpace.fromJson(json.decode(str));

String createSpaceToJson(CreateSpace data) => json.encode(data.toJson());

class CreateSpace {
  CreateSpace({
    this.message,
    this.code,
    this.name,
    this.id,
  });

  String message;
  int code;
  String name;
  String id;

  factory CreateSpace.fromJson(Map<String, dynamic> json) => CreateSpace(
        message: json["message"],
        code: json["code"],
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "code": code,
        "name": name,
        "id": id,
      };
}
