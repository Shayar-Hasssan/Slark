import 'dart:convert';

import 'package:http/http.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/space.dart';

// ignore: camel_case_types
class API_Space_Provider {
  Map<String, String> token = {'bearer': accToken};
  String baseUrl = 'https://slark-backend.herokuapp.com/';
  String createUrl = 'space';
  Future createSpace(spacedata) async {
    print('IN PROVIDER');
    var response;
    var request = await post(
      Uri.parse('$baseUrl$createUrl'),
      headers: {'content-type': 'application/json', 'Authorization': '$token'},
      body: jsonEncode(spacedata),
    );
    print('///////////////');
    response = spaceFromJson(request.body);
    print('***********');
    return response;
  }
}
