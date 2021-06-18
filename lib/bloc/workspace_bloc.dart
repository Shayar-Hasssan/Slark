import 'package:slark/api/workspace.dart';

class WorkspaceBloc {
  // API_Workspace_Provider apiProv = new API_Workspace_Provider();
  WorkspaceBloc();
  Future createWorkspace(name) async {
    print("IN workspace bloc");
    print('Workspace Name in Bloc : $name');
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var workspaceData;
    await apiProv.createWorkspace(name).then((value) {
      print("/////");
      print('PRINTING THE MESSAGE');
      print(value.message);
      print('________________');
      workspaceData = value;
    });
    return workspaceData;
  }

  Future invite(email) async {
    print("IN Invite bloc");
    print('Workspace Name in Bloc : $email');
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var workspaceData;
    await apiProv.invite(email).then((value) {
      print("/////");
      print('PRINTING THE MESSAGE');
      print(value.message);
      print('________________');
      workspaceData = value;
    });
    return workspaceData;
  }

  Future getWS(id) async {
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var wsdata;
    print('IN GET WS BLOC');
    print('WS Id is $id');
    await apiProv.getWS(id).then((value) {
      print('THE MESSAGE IS ${value.message}');
      wsdata = value;
    });
    return wsdata;
  }
}
