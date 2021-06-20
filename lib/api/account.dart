import 'dart:convert';

import 'package:http/http.dart';
import 'package:slark/model/account_login.dart';
import 'package:slark/model/account_register.dart';
import 'package:slark/model/issue.dart';
import 'package:slark/model/password.dart';

// ignore: camel_case_types
class API_Account_Provider {
  String baseUrl = 'https://slark-backend.herokuapp.com/';
  String registerUrl = 'account/signup';
  String loginUrl = 'account/login';
  String verifyUrl = 'account/reactivate/:email';
  // Map<String, String> headers = {'content-type': 'application/json'};

  Future register(userData) async {
    var response;
    print("In Register API");
    var request = await post(
      Uri.parse('$baseUrl$registerUrl'),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(userData),
    );
    if (request.statusCode == 200) {
      print('200 Status Coddee if statement');
      response = accountRegisterFromJson(request.body);
    } else if (request.statusCode == 401) {
      print('AN ISSUE IS HERE 401 STATUS CODEE');
      response = issueFromJson(request.body);
    }
    return response;
  }

  Future login(userData) async {
    var response;
    print('In login API');
    var request = await post(
      Uri.parse('$baseUrl$loginUrl'),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(userData),
    );
    print(request.body);
    if (request.statusCode == 200) {
      print('200 Status Coddee if statement');
      response = accountLoginFromJson(request.body);
    } else if (request.statusCode == 401) {
      print('AN ISSUE IS HERE 401 STATUS CODEE');
      response = issueFromJson(request.body);
    } else if (request.statusCode == 409) {
      print('AN ISSUE IS HERE 409 STATUS CODEE');
      response = passwordFromJson(request.body);
    }

    return response;
  }

  verify(email) async {
    print('In Verify API');
    var request = await get('$baseUrl$verifyUrl');
    var response = accountRegisterFromJson(request.body);
    return response;
  }
}
