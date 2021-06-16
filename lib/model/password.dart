import 'dart:convert';

Password passwordFromJson(String str) => Password.fromJson(json.decode(str));

String passwordToJson(Password data) => json.encode(data.toJson());

class Password {
  Password({
    this.message,
    this.email,
    this.password,
    this.code,
  });

  String message;
  String email;
  String password;
  int code;

  factory Password.fromJson(Map<String, dynamic> json) => Password(
        message: json["message"],
        email: json["email"],
        password: json["password"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "email": email,
        "password": password,
        "code": code,
      };
}
