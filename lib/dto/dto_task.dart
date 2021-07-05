import 'package:slark/model/file.dart';

class DtoTask {
  int priority = 1;
  String name = '';
  String id = '';
  String status = '';
  bool completed = false;
  DateTime dueDate = DateTime.now();
  DateTime created = DateTime.now();
  List<Files> assets;
  List<dynamic> assignedUsers;
  List<dynamic> subtasks;
  List<dynamic> comments;
}
