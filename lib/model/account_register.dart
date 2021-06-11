import 'dart:convert';

import 'package:slark/model/user.dart';

AccountRegister accountRegisterFromJson(String str) =>
    AccountRegister.fromJson(json.decode(str));

String accountRegisterToJson(AccountRegister data) =>
    json.encode(data.toJson());

class AccountRegister {
  AccountRegister({
    this.code,
    this.message,
    this.user,
  });

  int code;
  String message;
  User user;

  factory AccountRegister.fromJson(Map<String, dynamic> json) =>
      AccountRegister(
        code: json["code"],
        message: json["message"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "message": message,
        "user": user.toJson(),
      };
}
