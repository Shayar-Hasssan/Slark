import 'dart:convert';
import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/CreateWorkSpeace.dart';
// import 'package:slark/model/issue.dart';
import 'package:slark/model/user.dart';
import 'package:slark/model/workspace.dart';

// ignore: camel_case_types
class API_Workspace_Provider {
  String baseUrl = 'https://api-slark.herokuapp.com/';
  String wsUrl = 'workspaces';
  String inviteUrl = '/invite-user';
  String rmvuserUrl = '/remove-user';
  String allUsersUrl = '/all-users?workspace=';
  Map<String, String> requestHeaders = {
    "Content-Type": "application/json",
    'Authorization': '$accToken'
  };
  Future createWorkspace(wsdata) async {
    var body = jsonEncode(wsdata);
    print('IN PROVIDER');
    var response;
    print(requestHeaders);
    print('$baseUrl$wsUrl');
    var request = await post(
      Uri.parse('$baseUrl$wsUrl'),
      headers: requestHeaders,
      body: "$body",
    );
    print(request.body);
    response = createWorkspaceFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future invite(email) async {
    print('IN PROVIDER');
    var response;
    var request = await post(
      Uri.parse('$baseUrl$wsUrl$inviteUrl'),
      headers: requestHeaders,
      body: jsonEncode(email),
    );
    if (request.statusCode == 201) {
      print(request.body);
      print('invited');
    } else {
      print('Please invite your friend to join us to send him an invitation');
    }
    response = jsonDecode(request.body);
    // response = issueFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future getWS(wsid) async {
    print('IN PROVIDER');
    var response;
    var request =
        await get(Uri.parse('$baseUrl$wsUrl/$wsid'), headers: requestHeaders);
    response = workspaceFromJson(request.body);
    print('OUT OF PROVIDER');
    return response;
  }

  Future deleteWS(wsId) async {
    print('IN PROVIDER');
    var response;
    var request = await delete(Uri.parse('$baseUrl$wsUrl/$wsId'),
        headers: requestHeaders);
    print(request.body);
    response = workspaceFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future removeUser(userInfo) async {
    print('IN PROVIDER');
    var response;
    var request = await delete(Uri.parse('$baseUrl$wsUrl$rmvuserUrl'),
        headers: requestHeaders);
    response = workspaceFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future getAllUserInWs(wsId) async {
    print('IN PROVIDER');
    var response;
    var request =
        await get(Uri.parse('$baseUrl$wsUrl/$wsId'), headers: requestHeaders);
    response = allUserFromJson(request.body);
    print('OUT OF PROVIDER');
    return response;
  }
}
