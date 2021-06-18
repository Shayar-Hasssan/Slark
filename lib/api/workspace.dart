import 'dart:convert';

import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/issue.dart';
import 'package:slark/model/CreateWorkSpeace.dart';

// ignore: camel_case_types
class API_Workspace_Provider {
  String baseUrl = 'https://slark-backend.herokuapp.com/';
  String createUrl = 'workspace';
  String inviteUrl = 'workspace/invite-user';
  Map<String, String> requestHeaders = {
    "Content-Type": "application/json",
    'Authorization': '$accToken'
  };
  Future createWorkspace(name) async {
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

  Future invite(email) async {
    print('IN PROVIDER');
    var response;
    var request = await post(
      Uri.parse('$baseUrl$inviteUrl'),
      headers: requestHeaders,
      body: jsonEncode(email),
    );
    print('///////////////');
    response = issueFromJson(request.body);
    print('***********');
    return response;
  }
}
