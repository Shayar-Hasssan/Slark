import 'package:slark/api/list.dart';

class ListBloc {
  ListBloc();
  Future createList(listdata) async {
    API_List_Provider apiProv = new API_List_Provider();
    var listData;
    print('IN List Bloc');
    await apiProv.createList(listdata).then((value) {
      listData = value;
    });
    print('out of Bloc');
    return listData;
  }

  Future deleteList(listId) async {
    API_List_Provider apiProv = new API_List_Provider();
    var listdata;
    print('IN List Bloc');
    await apiProv.deletList(listId).then((value) {
      listdata = value;
    });
    print('out of Bloc');
    return listdata;
  }

  Future getList(listId) async {
    API_List_Provider apiProv = new API_List_Provider();
    var listdata;
    print('IN List Bloc');
    await apiProv.getList(listId).then((value) {
      listdata = value;
    });
    print('out of Bloc');
    return listdata;
  }

  Future getAllLists(spaceId) async {
    API_List_Provider apiProv = new API_List_Provider();
    var listdata;
    print('IN List Bloc');
    await apiProv.getAllLists(spaceId).then((value) {
      listdata = value;
    });
    print('out of Bloc');
    return listdata;
  }

  Future updateList(listId, newdata) async {
    API_List_Provider apiProv = new API_List_Provider();
    var listdata;
    print('IN List Bloc');
    await apiProv.updateList(listId, newdata).then((value) {
      listdata = value;
    });
    print('out of Bloc');
    return listdata;
  }
}
