import 'dart:convert';
import 'package:http/http.dart';
// import 'package:http/http.dart' as http;
import 'package:slark/globals.dart';
import 'package:slark/model/create_list.dart';
import 'package:slark/model/list.dart';

// ignore: camel_case_types
class API_List_Provider {
  String baseUrl = 'https://api-slark.herokuapp.com/';
  String listUrl = 'lists';
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
    print(request.body);
    response = createlistFromJson(request.body);
    print(response);
    print('Out of provider');
    return response;
  }

  Future deletList(listId) async {
    print('In Provider');
    var response;
    var request = await delete(Uri.parse('$baseUrl$listUrl/$listId'),
        headers: requestHeaders);
    //TODO check response
    //response = listtFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future getList(listId) async {
    print('IN PROVIDER');
    var response;
    var request = await get(
      Uri.parse('$baseUrl$listUrl/$listId'),
      headers: requestHeaders,
    );
    print(request.body);
    response = listtFromJson(request.body);
    print(response);
    print('Out of provider');
    return response;
  }

  Future getAllLists(spaceId) async {
    print('IN PROVIDER');
    var response;
    var request = await get(
      Uri.parse('$baseUrl$listUrl/?_space=$spaceId'),
      headers: requestHeaders,
    );
    print(request.body);
    response = listFromJson(request.body);
    print(response);
    print('Out of provider');
    return response;
  }

  Future updateList(listId, newdata) async {
    print('IN PROVIDER');
    var response;
    var request = await post(
      Uri.parse('$baseUrl$listUrl/$listId'),
      headers: requestHeaders,
      body: jsonEncode(newdata),
    );
    print(request.body);
    response = listtFromJson(request.body);
    print(response);
    print('Out of provider');
    return response;
  }
}
