import 'package:slark/api/task.dart';

class TaskBloc {
  TaskBloc();
  Future createTask(data) async {
    API_Task_Provider apiProv = new API_Task_Provider();
    var taskdata;
    print('In Task Bloc');
    await apiProv.createTask(data).then((value) {
      taskdata = value;
    });
    return taskdata;
  }

  Future updateTask(task) async {
    API_Task_Provider apiProv = new API_Task_Provider();
    var taskdata;
    print('In Task Bloc');
    await apiProv.updateTask(task).then((value) {
      taskdata = value;
    });
    return taskdata;
  }

  Future deleteTask(taskId) async {
    API_Task_Provider apiProv = new API_Task_Provider();
    var taskdata;
    print('In Task Bloc');
    await apiProv.deleteTask(taskId).then((value) {
      taskdata = value;
    });
    return taskdata;
  }
}
