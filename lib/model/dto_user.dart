import 'package:slark/model/dto_ws.dart';

class DtoUser {
  String username = '';
  List<DtoWS> workspaces = [];
  String role = 'workspace_owner';
  // DtoModel(this.username, this.workspaceId, this.workspacename, this.spaceId,
  //     this.spacename);
  DtoUser() {
    print('In DTO USER');
    print(username);
    print(workspaces);
    print(role);
  }
}
