class Role {
  Role({
    this.name,
    this.number,
    this.targetId,
  });

  String name;
  int number;
  String targetId;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
        name: json["name"],
        number: json["number"],
        targetId: json["targetId"] == null ? null : json["targetId"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "number": number,
        "targetId": targetId == null ? null : targetId,
      };
}
