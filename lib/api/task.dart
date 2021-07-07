import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/task.dart';
import 'package:slark/model/create_task.dart';

// ignore: camel_case_types
class API_Task_Provider {
  Map<String, String> token = {'bearer': accToken};
  String baseUrl = 'https://api-slark.herokuapp.com/';
  String taskUrl = 'tasks';
  Map<String, String> requestHeaders = {
    "Content-Type": "application/json",
    'Authorization': '$accToken'
  };
  Future createTask(taskdata) async {
    print('IN API PROVIDER');
    var response;
    var request = await post(Uri.parse('$baseUrl$taskUrl'),
        headers: requestHeaders, body: jsonEncode(taskdata));
    print(request.body);
    response = createtaskFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future updateTask(taskid, taskdata) async {
    print('IN API PROVIDER');
    var response;
    var request = await put(Uri.parse('$baseUrl$taskUrl/$taskid'),
        headers: requestHeaders, body: jsonEncode(taskdata));
    print(request.body);
    response = taskFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future deleteTask(taskId) async {
    print('In Provider');
    var response;
    var request = await delete(Uri.parse('$baseUrl$taskUrl/$taskId'),
        headers: requestHeaders);
    response = taskFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future getTask(taskId) async {
    print('IN PROVIDER');
    var response;
    var request = await get(
      Uri.parse('$baseUrl$taskUrl/taskId'),
      headers: requestHeaders,
    );
    print(request.body);
    response = taskFromJson(request.body);
    print(response);
    print('Out of provider');
    return response;
  }

  Future getAllTasks(listId) async {
    print('IN PROVIDER');
    var response;
    var request = await get(
      Uri.parse('$baseUrl$taskUrl?listId=$listId'),
      headers: requestHeaders,
    );
    print(request.body);
    response = tasksFromJson(request.body);
    print(response);
    print('Out of provider');
    return response;
  }
}
