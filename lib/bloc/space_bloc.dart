import 'package:slark/api/space.dart';

class SpaceBloc {
  SpaceBloc();
  Future createSpace(spacedata) async {
    print("IN Space bloc");
    API_Space_Provider apiProv = new API_Space_Provider();
    var spaceData;
    await apiProv.createSpace(spacedata).then((value) {
      spaceData = value;
    });
    print('out of Bloc');
    return spaceData;
  }

  Future getSpace(spaceid) async {
    API_Space_Provider apiProv = new API_Space_Provider();
    var spacedata;
    print('IN  Space BLOC');
    await apiProv.getSpace(spaceid).then((value) {
      spacedata = value;
    });
    print('out of Bloc');
    return spacedata;
  }

  Future getAllSpaces(wsid) async {
    API_Space_Provider apiProv = new API_Space_Provider();
    var spacedata;
    print('IN  Space BLOC');
    await apiProv.getAllSpaces(wsid).then((value) {
      spacedata = value;
    });
    print('out of Bloc');
    return spacedata;
  }

  Future deleteSpace(spaceId, wsId) async {
    API_Space_Provider apiProv = new API_Space_Provider();
    var spacedata;
    print('IN Space Bloc');
    await apiProv.deleteSpace(spaceId, wsId).then((value) {
      spacedata = value;
    });
    print('out of Bloc');
    return spacedata;
  }

  Future updateSpace(spaceId, spacedata) async {
    API_Space_Provider apiProv = new API_Space_Provider();
    var spacedata;
    print('IN Space Bloc');
    await apiProv.updateSpace(spaceId, spacedata).then((value) {
      spacedata = value;
    });
    print('out of Bloc');
    return spacedata;
  }
}
