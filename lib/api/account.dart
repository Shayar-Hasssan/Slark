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
    print("i am in register");
    var request = await post(
      Uri.parse('$baseUrl$registerUrl'),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(userData),
    );
    if (request.statusCode == 200) {
      print('200 Status Coddee if statement');
      response = accountRegisterFromJson(request.body);
      print("*****");
      print(response);
    } else if (request.statusCode == 401) {
      print('AN ISSUE IS HERE 401 STATUS CODEE');
      response = issueFromJson(request.body);
      print('&&&&&&&&&&');
      print(response);
    }
    return response;
  }

  Future login(userData) async {
    var response;
    print('In the login API');
    print('Data is : $userData');
    var request = await post(
      Uri.parse('$baseUrl$loginUrl'),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(userData),
    );
    print(request.body);
    if (request.statusCode == 200) {
      print('200 Status Coddee if statement');
      var xx = jsonDecode(request.body)['user']['_roles'];
      // var ss = jsonDecode(xx)['roles'].toString();
      print('SSSSSS $xx');
      response = accountLoginFromJson(request.body);
      print('*****');
      print(response.code);
      print('[[[[[[]]]]]]]');
      print('ROLES ARE ${response.user.roles}');
      print('TOKEN IS ${response.token}');
    } else if (request.statusCode == 401) {
      print('AN ISSUE IS HERE 401 STATUS CODEE');
      response = issueFromJson(request.body);
      print('##########');
      print(response.toString());
    } else if (request.statusCode == 409) {
      print('AN ISSUE IS HERE 409 STATUS CODEE');
      response = passwordFromJson(request.body);
      print('##########');
      print(response.toString());
    }

    return response;
  }

  verify(email) async {
    print('Verify API');
    var request = await get('$baseUrl$verifyUrl');
    print(request.body);
    var response = accountRegisterFromJson(request.body);
    print('??????????');
    print(response.code);
    print(response.message);
    return response;
  }
}
