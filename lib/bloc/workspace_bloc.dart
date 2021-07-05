import 'package:slark/api/workspace.dart';

class WorkspaceBloc {
  WorkspaceBloc();
  Future createWorkspace(wsdata) async {
    print("IN WS bloc");

    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var workspaceData;
    await apiProv.createWorkspace(wsdata).then((value) {
      workspaceData = value;
    });
    print('Out of Bloc');
    return workspaceData;
  }

  Future invite(email) async {
    //user email must be signedup in SLARK :))
    print("IN WS Bloc");
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var workspaceData;
    await apiProv.invite(email).then((value) {
      workspaceData = value;
    });
    print('Out of Bloc');
    return workspaceData;
  }

  Future getWS(wsid) async {
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var wsdata;
    print('IN WS BLOC');
    await apiProv.getWS(wsid).then((value) {
      print('THE MESSAGE IS ${value.message}');
      wsdata = value;
    });
    print('Out of Bloc');
    return wsdata;
  }

  Future deleteWS(wsId) async {
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var wsdata;
    print('IN  WS BLOC');
    await apiProv.deleteWS(wsId).then((value) {
      wsdata = value;
    });
    print('Out of Bloc');
    return wsdata;
  }

  Future removeUser(userInfo) async {
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var rmvdata;
    print('IN WS BLOC');
    await apiProv.removeUser(userInfo).then((value) {
      rmvdata = value;
    });
    print('Out of Bloc');
    return rmvdata;
  }

  Future getAllUserInWs(wsId) async {
    API_Workspace_Provider apiProv = new API_Workspace_Provider();
    var wsUserdata;
    print('IN WS BLOC');
    await apiProv.getAllUserInWs(wsId).then((value) {
      wsUserdata = value;
    });
    print('Out of Bloc');
    return wsUserdata;
  }
}
