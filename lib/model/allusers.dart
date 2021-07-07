import 'dart:convert';

List<AllUsers> allUsersFromJson(String str) =>
    List<AllUsers>.from(json.decode(str).map((x) => AllUsers.fromJson(x)));

String allUsersToJson(List<AllUsers> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AllUsers {
  AllUsers({
    this.roles,
    this.workspaces,
    this.verified,
    this.id,
    this.name,
    this.email,
    this.allUserId,
  });

  List<String> roles;
  List<String> workspaces;
  bool verified;
  String id;
  String name;
  String email;
  String allUserId;

  factory AllUsers.fromJson(Map<String, dynamic> json) => AllUsers(
        roles: List<String>.from(json["_roles"].map((x) => x)),
        workspaces: List<String>.from(json["_workspaces"].map((x) => x)),
        verified: json["verified"],
        id: json["_id"],
        name: json["name"],
        email: json["email"],
        allUserId: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "_roles": List<dynamic>.from(roles.map((x) => x)),
        "_workspaces": List<dynamic>.from(workspaces.map((x) => x)),
        "verified": verified,
        "_id": id,
        "name": name,
        "email": email,
        "id": allUserId,
      };
}
