library slark.globals;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:slark/dto/dto_ws.dart';
import 'package:slark/model/account_login.dart';
import 'package:slark/model/user.dart';

User user;

AccountLogin login;
bool isOwner;
int roleN;
String userId = ""; //login.user.id;
String accToken = ""; //login.token;
// String accToken =
//     "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNoZXJvLm1pbm8uMTZAZ21haWwuY29tIiwiaWQiOiI2MGUwMTc5OTQyMDg4YzAwMTU3ZGI3MmMiLCJpYXQiOjE2MjU0NzQwMzIsImV4cCI6MTYyNTUxMDAzMn0.TN4G9QImrsX2t4VWSsIDRz1bDxF__4KxbmUZ3isDcbA";

// ignore: non_constant_identifier_names
Future<String> GetuserId() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  String userid = prefs.getString('userId');
  String token = prefs.getString('token');
  token != null ? accToken = token : "";
  userid != null ? userId = userid : "";
  if (accToken.isNotEmpty)
    return accToken;
  else
    return "";
}

checkRole(roleN) {
  roleN == 1 ? isOwner = false : isOwner = true;
  return isOwner;
}
