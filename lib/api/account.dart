import 'dart:convert';

import 'package:http/http.dart';
import 'package:slark/model/account_login.dart';
import 'package:slark/model/account_register.dart';

// ignore: camel_case_types
class API_Account_Provider {
  String baseUrl = 'https://slark-backend.herokuapp.com/';
  String registerUrl = 'account/signup';
  String loginUrl = 'account/login';
  String verifyUrl = 'account/reactivate/:email';
  Map<String, String> headers = {'content-type': 'application/json'};

  Future<AccountRegister> register(userData) async {
    print("i am in register");
    var request = await post(
      Uri.parse('$baseUrl$registerUrl'),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(userData),
    );
    var response = accountRegisterFromJson(request.body);
    print("*****");
    print(response);
    return response;
  }

  Future<AccountLogin> login(userData) async {
    print('In the login API');
    print('Data is : $userData');
    var request = await post(
      Uri.parse('$baseUrl$loginUrl'),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(userData),
    );
    print(request.body);
    var response = accountLoginFromJson(request.body);
    print('*****');
    print(response);
    return response;
  }

  // verify(email) async {
  //   var request = await get('$baseUrl$verifyUrl');
  // }
}
