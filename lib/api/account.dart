import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/account_login.dart';
import 'package:slark/model/account_register.dart';
import 'package:slark/model/issue.dart';
import 'package:slark/model/password.dart';
import 'package:slark/model/user.dart';

// ignore: camel_case_types
class API_Account_Provider {
  String baseUrl = 'https://api-slark.herokuapp.com/';
  String registerUrl = 'accounts/signup';
  String loginUrl = 'accounts/login';
  String verifyUrl = 'accounts/reactivate/:';
  String deleteUser = 'users/';

  Future register(userData) async {
    var response;
    print("In Register API");
    var request = await post(
      Uri.parse('$baseUrl$registerUrl'),
      headers: {'content-type': 'application/json'},
      body: jsonEncode(userData),
    );
    if (request.statusCode == 201) {
      print('201 Status Coddee if statement');
      try {
        response = accountRegisterFromJson(request.body);
      } catch (e) {
        response = issueFromJson(request.body);
      }
    }
    print('Out of provider');
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
    if (request.statusCode == 201) {
      print('201 Status Coddee if statement');
      response = accountLoginFromJson(request.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", response.token);
      await prefs.setString("userId", response.user.id);
      // print('AN ISSUE IS HERE ');
      // response = passwordFromJson(request.body);
    } else {
      print('AN ISSUE IS HERE 401 STATUS CODEE');
      response = issueFromJson(request.body);
    }
    //  else if (request.statusCode == 200) {
    //   print('200 Status Coddee if statement');
    //   response = accountLoginFromJson(request.body);
    // } else if (request.statusCode == 401) {
    //   print('AN ISSUE IS HERE 401 STATUS CODEE');
    //   response = issueFromJson(request.body);
    // } else if (request.statusCode == 409) {
    //   print('AN ISSUE IS HERE 409 STATUS CODEE');
    //   response = passwordFromJson(request.body);
    // }
    print('Out of provider');
    return response;
  }

  verify(email) async {
    print('In Verify API');
    var request = await get('$baseUrl$verifyUrl/:$email');
    var response = accountRegisterFromJson(request.body);
    return response;
  }

  Future deleteAcc(userid) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      'Authorization': '$accToken'
    };
    print('In Provider');
    var response;
    var request = await delete(Uri.parse('$baseUrl$deleteUser$userid'),
        headers: requestHeaders);
    response = userFromJson(request.body);
    print('Out of provider');
    return response;
  }
}
