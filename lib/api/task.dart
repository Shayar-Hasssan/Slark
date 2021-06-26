import 'dart:convert';
import 'package:http/http.dart' as http;
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
    print('In Provider');
    final url = Uri.parse('$baseUrl$taskUrl');
    final req = http.Request("DELETE", url);
    req.headers.addAll(requestHeaders);
    req.body = jsonEncode(taskId);
    final resp = await req.send();
    return await resp.stream.bytesToString();

    // var response;
    // var request =
    //     await delete(Uri.parse('$baseUrl$taskUrl'), headers: requestHeaders);
    // response = taskFromJson(request.body);
    // return response;
  }
}
