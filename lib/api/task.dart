import 'dart:convert';

import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/task.dart';

// ignore: camel_case_types
class API_Task_Provider {
  Map<String, String> token = {'bearer': accToken};
  String baseUrl = 'https://slark-backend.herokuapp.com/';
  String taskUrl = 'task';
  Map<String, String> requestHeaders = {
    "Content-Type": "application/json",
    'Authorization': '$accToken'
  };
  Future createTask(taskdata) async {
    var response;
    var request = await post(Uri.parse('$baseUrl$taskUrl'),
        headers: requestHeaders, body: jsonEncode(taskdata));
    response = taskFromJson(request.body);
    return response;
  }

  Future updateTask(taskdata) async {
    var response;
    var request = await put(Uri.parse('$baseUrl$taskUrl'),
        headers: requestHeaders, body: jsonEncode(taskdata));
    response = taskFromJson(request.body);
    return response;
  }

  Future deleteTask(taskId) async {
    var response;
    var request =
        await delete(Uri.parse('$baseUrl$taskUrl'), headers: requestHeaders);
    response = taskFromJson(request.body);
    return response;
  }
}
