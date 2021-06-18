import 'package:slark/api/space.dart';

class SpaceBloc {
  SpaceBloc();
  Future createSpace(spacedata) async {
    print("IN Space bloc");
    print('Workspace Name in Bloc : $spacedata');
    API_Space_Provider apiProv = new API_Space_Provider();
    var spaceData;
    await apiProv.createSpace(spacedata).then((value) {
      print("/////");
      print('PRINTING THE MESSAGE');
      print(value.message);
      print('________________');
      spaceData = value;
    });
    return spaceData;
  }

  Future getSpace(id) async {
    API_Space_Provider apiProv = new API_Space_Provider();
    var spacedata;
    print('IN GET Space BLOC');
    print('Space Id is $id');
    await apiProv.getSpace(id).then((value) {
      print('THE MESSAGE IS ${value.message}');
      spacedata = value;
    });
    return spacedata;
  }
}
