import 'package:slark/api/workspace.dart';

class WorkspaceBloc {
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
}
