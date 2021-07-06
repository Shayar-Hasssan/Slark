import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/all_spaces.dart';
import 'package:slark/model/create_space.dart';
import 'package:slark/model/space.dart';

// ignore: camel_case_types
class API_Space_Provider {
  String baseUrl = 'https://api-slark.herokuapp.com/';
  String spaceUrl = 'spaces';
  Map<String, String> requestHeaders = {
    "Content-Type": "application/json",
    'Authorization': '$accToken'
  };

  Future createSpace(spacedata) async {
    print('IN PROVIDER');
    print(spacedata);
    var response;
    var request = await post(
      Uri.parse('$baseUrl$spaceUrl'),
      headers: requestHeaders,
      body: jsonEncode(spacedata),
    );
    print(request.body);
    response = createSpaceFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future getSpace(spaceId) async {
    print('IN PROVIDER');
    var response;
    var request = await get(Uri.parse('$baseUrl$spaceUrl/$spaceId'),
        headers: requestHeaders);
    print('REQUEST GET BODY : ${request.body}');
    response = spaceFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future getAllSpaces(wsId) async {
    print('IN PROVIDER');
    var response;
    var request = await get(Uri.parse('$baseUrl$spaceUrl?workspaceId=$wsId'),
        headers: requestHeaders);
    print('REQUEST GET BODY : ${request.body}');
    response = allSpaceFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future deleteSpace(spaceid, wsId) async {
    print('In Provider');
    var response;
    var request = await delete(
        Uri.parse('$baseUrl$spaceUrl/$spaceid?workspace=$wsId'),
        headers: requestHeaders);
    response = spaceFromJson(request.body);
    print('Out of provider');
    return response;
  }

  Future updateSpace(spaceId, spacedata) async {
    print('In Provider');
    var response;
    print(spaceId);
    print(spacedata);
    var request = await put(Uri.parse('$baseUrl$spaceUrl/$spaceId'),
        headers: requestHeaders, body: jsonEncode(spacedata));
    print(request.body);
    response = spaceFromJson(request.body);
    print(response.name);
    print('Out of provider');
    return response;
  }
}
