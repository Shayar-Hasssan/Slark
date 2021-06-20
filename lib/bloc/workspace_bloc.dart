import 'package:slark/api/workspace.dart';

class WorkspaceBloc {
  WorkspaceBloc();
  Future createWorkspace(name) async {
    print("IN WS bloc");

    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var workspaceData;
    await apiProv.createWorkspace(name).then((value) {
      print('PRINTING THE MESSAGE');
      print(value.message);
      workspaceData = value;
    });
    return workspaceData;
  }

  Future invite(email) async {
    print("IN WS Bloc");
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var workspaceData;
    await apiProv.invite(email).then((value) {
      print('PRINTING THE MESSAGE');
      print(value.message);
      workspaceData = value;
    });
    return workspaceData;
  }

  Future getWS(id) async {
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var wsdata;
    print('IN WS BLOC');
    await apiProv.getWS(id).then((value) {
      print('THE MESSAGE IS ${value.message}');
      wsdata = value;
    });
    return wsdata;
  }

  Future deleteWS(wsId) async {
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var wsdata;
    print('IN  WS BLOC');
    await apiProv.deleteWS(wsId).then((value) {
      wsdata = value;
    });
    return wsdata;
  }

  Future removeUser(info) async {
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var wsdata;
    print('IN WS BLOC');
    await apiProv.removeUser(info).then((value) {
      wsdata = value;
    });
    return wsdata;
  }
}
