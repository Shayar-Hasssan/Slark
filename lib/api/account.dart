import 'dart:convert';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slark/globals.dart';
import 'package:slark/model/account_login.dart';
import 'package:slark/model/account_register.dart';
import 'package:slark/model/issue.dart';
// import 'package:slark/model/password.dart';
import 'package:slark/model/user.dart';

// ignore: camel_case_types
class API_Account_Provider {
  String baseUrl = 'https://api-slark.herokuapp.com/';
  String registerUrl = 'accounts/signup';
  String loginUrl = 'accounts/login';
  String verifyUrl = 'accounts/reactivate/:';
  String deleteUser = 'users/';
  String getUser = 'users/';

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
    // if (request.statusCode == 201) {
    if (jsonDecode(request.body)["token"] != null) {
      print('201 Status Coddee if statement');
      response = accountLoginFromJson(request.body);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString("token", response.token);
      await prefs.setString("userId", response.user.id);
    } else if (jsonDecode(request.body)["error"] != null) {
      response = jsonDecode(request.body)["error"]["error"];
    } else if (jsonDecode(request.body)["message"] != null) {
      response = jsonDecode(request.body)["message"];
    }
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

  Future getUserdata(userid) async {
    Map<String, String> requestHeaders = {
      "Content-Type": "application/json",
      'Authorization': '$accToken'
    };
    print('In Provider');
    var response;
    print(requestHeaders);
    print("$baseUrl$getUser$userid");
    var request = await get(Uri.parse('$baseUrl$getUser$userid'),
        headers: requestHeaders);
    print("Response:" + request.body.toString());
    if (request.statusCode == 401) {
      print("******************");
      print(request.statusCode);
      return "401";
    }

    response = userFromJson(request.body);
    print('Out of provider');
    return response;
  }
}
