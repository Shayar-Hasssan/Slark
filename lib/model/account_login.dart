import 'dart:convert';

import 'package:slark/model/user.dart';

AccountLogin accountLoginFromJson(String str) =>
    AccountLogin.fromJson(json.decode(str));

String accountLoginToJson(AccountLogin data) => json.encode(data.toJson());

class AccountLogin {
  AccountLogin({
    this.code,
    this.message,
    this.user,
    this.token,
  });

  int code;
  String message;
  User user;
  String token;

  factory AccountLogin.fromJson(Map<String, dynamic> json) => AccountLogin(
        code: json["code"],
        message: json["message"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "user": user.toJson(),
        "token": token,
      };
}




// class Workspace {
//   Workspace({
//     this.id,
//     this.name,
//   });

//   String id;
//   String name;

//   factory Workspace.fromJson(Map<String, dynamic> json) => Workspace(
//         id: json["_id"],
//         name: json["name"],
//       );

//   Map<String, dynamic> toJson() => {
//         "_id": id,
//         "name": name,
//       };
// }
