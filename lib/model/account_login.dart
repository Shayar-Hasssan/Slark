import 'dart:convert';

import 'package:slark/model/user.dart';

AccountLogin accountLoginFromJson(String str) =>
    AccountLogin.fromJson(json.decode(str));

String accountLoginToJson(AccountLogin data) => json.encode(data.toJson());

class AccountLogin {
  AccountLogin({
    this.user,
    this.token,
  });

  User user;
  String token;

  factory AccountLogin.fromJson(Map<String, dynamic> json) => AccountLogin(
        user: json[""] == null
            ? null
            : User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
        "token": token,
      };
}
