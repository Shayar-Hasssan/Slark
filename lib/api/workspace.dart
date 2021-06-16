import 'dart:convert';

import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/CreateWorkSpeace.dart';
import 'package:slark/model/workspace.dart';

// ignore: camel_case_types
class API_Workspace_Provider {
  String baseUrl = 'https://slark-backend.herokuapp.com/';
  String createUrl = 'workspace';
  Future createWorkspace(name) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      'Authorization': '$accToken'
    };
    var body = jsonEncode(name);
    print('IN PROVIDER');
    var response;
    print(requestHeaders);
    print('$baseUrl$createUrl');
    var request = await post(
      Uri.parse('$baseUrl$createUrl'),
      headers: requestHeaders,
      body: "$body",
    );
    print('///////////////');
    print(request.body);
    response = CreateworkspaceFromJson(request.body);
    print('***********');
    return response;
  }
}
