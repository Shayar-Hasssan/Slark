import 'dart:convert';

import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/list.dart';

// ignore: camel_case_types
class API_List_Provider {
  Map<String, String> token = {'bearer': accToken};
  String baseUrl = 'https://slark-backend.herokuapp.com/';
  String listUrl = 'list';
  Map<String, String> requestHeaders = {
    "Content-Type": "application/json",
    'Authorization': '$accToken'
  };
  Future createList(listdata) async {
    print('IN PROVIDER');
    var response;
    var request = await post(
      Uri.parse('$baseUrl$listUrl'),
      headers: requestHeaders,
      body: jsonEncode(listdata),
    );
    print('///////////////');
    print(request.body);
    print('^^^^^^');
    response = listtFromJson(request.body);
    print(response);
    print('***********');
    return response;
  }

  Future deletList(listId) async {
    print('In Provider');
    var response;
    var request =
        await delete(Uri.parse('$baseUrl$listUrl'), headers: requestHeaders);
    response = listtFromJson(request.body);
    return response;
  }
}
