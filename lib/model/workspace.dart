import 'dart:convert';

Workspace workspaceFromJson(String str) => Workspace.fromJson(json.decode(str));

String workspaceToJson(Workspace data) => json.encode(data.toJson());

class Workspace {
  Workspace({
    this.message,
    this.workspace,
    this.code,
  });

  String message;
  WorkspaceClass workspace;
  int code;

  factory Workspace.fromJson(Map<String, dynamic> json) => Workspace(
        message: json["message"],
        workspace: WorkspaceClass.fromJson(json["workspace"]),
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "workspace": workspace.toJson(),
        "code": code,
      };
}

class WorkspaceClass {
  WorkspaceClass({
    this.spaces,
    this.id,
    this.name,
  });

  List<String> spaces;
  String id;
  String name;

  factory WorkspaceClass.fromJson(Map<String, dynamic> json) => WorkspaceClass(
        spaces: json["_spaces"] == null
            ? null
            : List<String>.from(json["_spaces"].map((x) => x)),
        // spaces: List<String>.from(json["_spaces"].map((x) => x ? x : null)),
        id: json["_id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "_spaces": List<dynamic>.from(spaces.map((x) => x)),
        "_id": id,
        "name": name,
      };
}
