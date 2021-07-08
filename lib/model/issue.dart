import 'dart:convert';

Issue issueFromJson(String str) => Issue.fromJson(json.decode(str));

String issueToJson(Issue data) => json.encode(data.toJson());

class Issue {
  Issue({
    this.message,
  });

  String message;

  factory Issue.fromJson(Map<String, dynamic> json) => Issue(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
