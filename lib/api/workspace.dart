import 'dart:convert';

import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/workspace.dart';

// ignore: camel_case_types
class API_Workspace_Provider {
  Map<String, String> token = {'bearer': accToken};
  String baseUrl = 'https://slark-backend.herokuapp.com/';
  String createUrl = 'workspace';
  Future createWorkspace(name) async {
    print('IN PROVIDER');
    var response;
    var request = await post(
      Uri.parse('$baseUrl$createUrl'),
      headers: {'content-type': 'application/json', 'Authorization': '$token'},
      body: jsonEncode(name),
    );
    print('///////////////');
    response = workspaceFromJson(request.body);
    print('***********');
    return response;
  }
}
