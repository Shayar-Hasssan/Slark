import 'package:slark/api/space.dart';

class SpaceBloc {
  SpaceBloc();
  Future createSpace(spacedata) async {
    print("IN Space bloc");
    API_Space_Provider apiProv = new API_Space_Provider();
    var spaceData;
    await apiProv.createSpace(spacedata).then((value) {
      print('PRINTING THE MESSAGE');
      print(value.message);
      spaceData = value;
    });
    return spaceData;
  }

  Future getSpace(id) async {
    API_Space_Provider apiProv = new API_Space_Provider();
    var spacedata;
    print('IN  Space BLOC');
    await apiProv.getSpace(id).then((value) {
      print('THE MESSAGE IS ${value.message}');
      spacedata = value;
    });
    return spacedata;
  }

  Future deleteSpace(data) async {
    API_Space_Provider apiProv = new API_Space_Provider();
    var spacedata;
    print('IN Space Bloc');
    await apiProv.deleteSpace(data).then((value) {
      spacedata = value;
    });
    return spacedata;
  }

  Future updateSpace(data) async {
    API_Space_Provider apiProv = new API_Space_Provider();
    var spacedata;
    print('IN Space Bloc');
    await apiProv.updateSpace(data).then((value) {
      spacedata = value;
    });
    return spacedata;
  }
}
