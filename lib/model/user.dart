import 'dart:convert';

import 'package:slark/model/CreateWorkSpeace.dart';
import 'package:slark/model/role.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

// List<User> allUserFromJson(String str) =>
//     List<User>.from(json.decode(str).map((x) => User.fromJson(x)));
// String allUserToJson(List<User> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User({
    this.roles,
    this.workspaces,
    this.verified,
    this.id,
    this.name,
    this.password,
    this.email,
    this.v,
  });

  List<Role> roles;
  List<CreateWorkspace> workspaces;
  bool verified;
  String id;
  String name;
  String password;
  String email;
  int v;

  factory User.fromJson(Map<String, dynamic> json) => User(
        roles: List<Role>.from(json["_roles"].map((x) => Role.fromJson(x))),
        workspaces: List<CreateWorkspace>.from(
            json["_workspaces"].map((x) => CreateWorkspace.fromJson(x))),
        verified: json["verified"],
        id: json["_id"],
        name: json["name"],
        password: json["password"],
        email: json["email"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_roles": List<dynamic>.from(roles.map((x) => x.toJson())),
        "_workspaces": List<dynamic>.from(workspaces.map((x) => x.toJson())),
        "verified": verified,
        "_id": id,
        "name": name,
        "password": password,
        "email": email,
        "__v": v,
      };
}

// class Role {
//   Role({
//     this.id,
//     this.name,
//     this.number,
//     this.v,
//   });

//   String id;
//   String name;
//   int number;
//   int v;

//   factory Role.fromJson(Map<String, dynamic> json) => Role(
//         id: json["_id"],
//         name: json["name"],
//         number: json["number"],
//         v: json["__v"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//         "number": number,
//         "__v": v,
//       };
// }
