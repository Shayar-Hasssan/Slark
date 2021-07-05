class Role {
  Role({
    this.id,
    this.name,
    this.number,
    this.v,
    this.targetId,
  });

  String id;
  String name;
  int number;
  int v;
  String targetId;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["_id"],
        name: json["name"],
        number: json["number"],
        v: json["__v"],
        targetId: json["targetId"] == null ? null : json["targetId"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "number": number,
        "__v": v,
        "targetId": targetId == null ? null : targetId,
      };
}
