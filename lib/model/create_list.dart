import 'dart:convert';

Createlist createlistFromJson(String str) =>
    Createlist.fromJson(json.decode(str));

String createlistToJson(Createlist data) => json.encode(data.toJson());

List<Createlist> listFromJson(String str) =>
    List<Createlist>.from(json.decode(str).map((x) => Createlist.fromJson(x)));

String listToJson(List<Createlist> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Createlist {
  Createlist({
    this.id,
    this.name,
    this.space,
    this.v,
  });

  String id;
  String name;
  String space;
  int v;

  factory Createlist.fromJson(Map<String, dynamic> json) => Createlist(
        id: json["_id"],
        name: json["name"],
        space: json["_space"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "_space": space,
        "__v": v,
      };
}
