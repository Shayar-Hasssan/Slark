import 'dart:convert';

import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/create_space.dart';
import 'package:slark/model/space.dart';

// ignore: camel_case_types
class API_Space_Provider {
  Map<String, String> token = {'bearer': accToken};
  String baseUrl = 'https://slark-backend.herokuapp.com/';
  String createUrl = 'space';
  Map<String, String> requestHeaders = {
    "Content-Type": "application/json",
    'Authorization': '$accToken'
  };
  Future createSpace(spacedata) async {
    print('IN PROVIDER');
    var response;
    var request = await post(
      Uri.parse('$baseUrl$createUrl'),
      headers: requestHeaders,
      body: jsonEncode(spacedata),
    );
    print('///////////////');
    print(request.body);
    print('^^^^^^');
    response = createSpaceFromJson(request.body);
    print(response);
    print('***********');
    return response;
  }
}
