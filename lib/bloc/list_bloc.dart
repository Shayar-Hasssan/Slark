import 'package:slark/api/list.dart';

class ListBloc {
  ListBloc();
  Future createList(data) async {
    API_List_Provider apiProv = new API_List_Provider();
    var listdata;
    print('IN List Bloc');
    await apiProv.createList(data).then((value) {
      listdata = value;
    });
    return listdata;
  }

  Future deleteList(listId) async {
    API_List_Provider apiProv = new API_List_Provider();
    var listdata;
    print('IN List Bloc');
    await apiProv.deletList(listId).then((value) {
      listdata = value;
    });
    return listdata;
  }
}
