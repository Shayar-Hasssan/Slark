import 'dart:convert';

Files filesFromJson(String str) => Files.fromJson(json.decode(str));

String filesToJson(Files data) => json.encode(data.toJson());

class Files {
  Files({
    this.id,
    this.url,
    this.thumbnail,
    this.name,
    this.size,
    this.height,
    this.width,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String id;
  String url;
  String thumbnail;
  String name;
  int size;
  int height;
  int width;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Files.fromJson(Map<String, dynamic> json) => Files(
        id: json["_id"] == null ? null : json["_id"],
        url: json["url"] == null ? null : json["url"],
        thumbnail: json["thumbnail"] == null ? null : json["thumbnail"],
        name: json["name"] == null ? null : json["name"],
        size: json["size"] == null ? null : json["size"],
        height: json["height"] == null ? null : json["height"],
        width: json["width"] == null ? null : json["width"],
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
        "url": url,
        "thumbnail": thumbnail,
        "name": name,
        "size": size,
        "height": height,
        "width": width,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
