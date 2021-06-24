import 'dart:convert';

import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/create_space.dart';
import 'package:slark/model/space.dart';

// ignore: camel_case_types
class API_Space_Provider {
  Map<String, String> token = {'bearer': accToken};
  String baseUrl = 'https://slark-backend.herokuapp.com/';
  String spaceUrl = 'space';
  Map<String, String> requestHeaders = {
    "Content-Type": "application/json",
    'Authorization': '$accToken'
  };

  Future createSpace(spacedata) async {
    print('IN PROVIDER');
    var response;
    var request = await post(
      Uri.parse('$baseUrl$spaceUrl'),
      headers: requestHeaders,
      body: jsonEncode(spacedata),
    );
    print(request.body);
    response = createSpaceFromJson(request.body);
    return response;
  }

  Future getSpace(id) async {
    print('IN PROVIDER');
    var response;
    var request =
        await get(Uri.parse('$baseUrl$spaceUrl/$id'), headers: requestHeaders);
    print('REQUEST GET BODY : ${request.body}');
    response = spaceFromJson(request.body);
    return response;
  }

  Future deleteSpace(spacedata) async {
    print('In Provider');
    var response;
    var request =
        await delete(Uri.parse('$baseUrl$spaceUrl'), headers: requestHeaders);
    response = spaceFromJson(request.body);
    return response;
  }

  Future updateSpace(spacedata) async {
    print('In Provider');
    var response;
    var request = await put(Uri.parse('$baseUrl$spaceUrl'),
        headers: requestHeaders, body: spacedata);
    response = spaceFromJson(request.body);
    return response;
  }
}
