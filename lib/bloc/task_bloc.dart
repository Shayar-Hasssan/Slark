import 'package:slark/api/task.dart';

class TaskBloc {
  TaskBloc();
  Future createTask(taskdata) async {
    API_Task_Provider apiProv = new API_Task_Provider();
    var taskdata;
    print('In Task Bloc');
    await apiProv.createTask(taskdata).then((value) {
      taskdata = value;
    });
    print('Out of Bloc');
    return taskdata;
  }

  Future updateTask(taskid, taskdata) async {
    API_Task_Provider apiProv = new API_Task_Provider();
    var taskdata;
    print('In Task Bloc');
    await apiProv.updateTask(taskid, taskdata).then((value) {
      taskdata = value;
    });
    print('Out of Bloc');
    return taskdata;
  }

  Future deleteTask(taskId) async {
    API_Task_Provider apiProv = new API_Task_Provider();
    var taskdata;
    print('In Task Bloc');
    await apiProv.deleteTask(taskId).then((value) {
      taskdata = value;
    });
    print('Out of Bloc');
    return taskdata;
  }

  Future getTask(taskId) async {
    API_Task_Provider apiProv = new API_Task_Provider();
    var taskdata;
    print('In Task Bloc');
    await apiProv.getTask(taskId).then((value) {
      taskdata = value;
    });
    print('Out of Bloc');
    return taskdata;
  }

  Future getAllTasks(listId) async {
    API_Task_Provider apiProv = new API_Task_Provider();
    var taskdata;
    print('In Task Bloc');
    await apiProv.getAllTasks(listId).then((value) {
      taskdata = value;
    });
    print('Out of Bloc');
    return taskdata;
  }
}
