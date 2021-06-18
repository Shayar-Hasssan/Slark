import 'dart:convert';

import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/issue.dart';
import 'package:slark/model/CreateWorkSpeace.dart';
import 'package:slark/model/workspace.dart';

// ignore: camel_case_types
class API_Workspace_Provider {
  String baseUrl = 'https://slark-backend.herokuapp.com/';
  String wsUrl = 'workspace';
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
    print('$baseUrl$wsUrl');
    var request = await post(
      Uri.parse('$baseUrl$wsUrl'),
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

  Future getWS(id) async {
    print('IN PROVIDER');
    var response;
    var request =
        await get(Uri.parse('$baseUrl$wsUrl/$id'), headers: requestHeaders);
    print('$baseUrl$wsUrl/$id');
    response = workspaceFromJson(request.body);
    print('OUT OF PROVIDER');
    return response;
  }
}
