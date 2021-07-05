import 'package:flutter/material.dart';
import 'package:slark/bloc/account_bloc.dart';
// import 'package:slark/bloc/workspace_bloc.dart';
import 'package:slark/globals.dart';
import 'package:slark/dto/dto_space.dart';
import 'package:slark/dto/dto_user.dart';
import 'package:slark/dto/dto_ws.dart';
// import 'package:slark/globals.dart';
// import 'package:slark/ui/home.dart';

import 'package:slark/ui/register.dart';
import 'package:slark/ui/splashScreen.dart';
import 'package:slark/ui/stepper.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;

  String email = '';
  String password = '';
  Map<String, String> login;
  final _bloc = AccountBloc();
  String message = '';
  String name = '';
  // final _wsbloc = WorkspaceBloc();
  var udto = new DtoUser();
  var wsdto = new DtoWS();
  var spacedto = new DtoSpace();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    _emailController.addListener(_handleEmailChanged);
    _passwordController.addListener(_handlePassChanged);
  }

  void _handleEmailChanged() {
    this.email = _emailController.text;
  }

  void _handlePassChanged() {
    this.password = _passwordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Scaffold(
          body: SingleChildScrollView(
            child: Form(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100.0,
                  ),
                  Text(
                    'Login',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Aviliator',
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Color(0xff7b68ee),
                    ),
                  ),
                  Divider(
                    color: Color(0xff7b68ee),
                    thickness: 0.5,
                    indent: 120.0,
                    endIndent: 120.0,
                  ),
                  SizedBox(height: 70.0),
                  SizedBox(
                    height: 60.0,
                    width: 340.0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'example@example.com',
                          labelText: 'E-Mail',
                          labelStyle: TextStyle(
                            letterSpacing: 4.0,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xff7b68ee),
                            ),
                          ),
                        ),
                        controller: _emailController,
                      ),
                    ),
                  ),
                  //SizedBox(height: 15.0),
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 60.0,
                    width: 350.0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            letterSpacing: 4.0,
                            color: Colors.grey,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1.0, color: Colors.grey[400]),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1.0,
                              color: Color(0xff7b68ee),
                            ),
                          ),
                        ),
                        obscureText: true,
                        obscuringCharacter: '*',
                        controller: _passwordController,
                      ),
                    ),
                  ),
                  SizedBox(height: 40.0),
                  SizedBox(
                    height: 50.0,
                    width: 300.0,
                    // ignore: deprecated_member_use
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(5.0, 0.0, 0.0, 0.0),
                      child: Container(
                        height: 50.0,
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          onPressed: () async {
                            CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(
                                  Color(0xff7b68ee)),
                            );
                            login = {'email': email, 'password': password};

                            // int code;
                            await _bloc.loginAcc(login).then((value) {
                              // setState(() {
                              //   message = value.message;
                              //   code = value.code;
                              // });
                              // showAlertDialog(context, message, code, value);
                              showAlertDialog(context, value);
                            });
                          },
                          color: Color(0xff7b68ee),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          child: Ink(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0)),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 300.0,
                                minHeight: 50.0,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                "Login",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),

                  // ignore: deprecated_member_use
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      child: Text(
                        'Dont have an account? Register',
                        style: TextStyle(
                          color: Color(0xff7b68ee),
                          fontSize: 15.0,
                          letterSpacing: 2.0,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // showAlertDialog(BuildContext ctx, String message, int code, data) {
  showAlertDialog(BuildContext ctx, data) {
    bool isOK = false;
    // ignore: deprecated_member_use
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        if (isOK) {
          setState(() {
            accToken = data.token;
            print('______$accToken');
          });

          if (data.user.workspaces.length > 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SplashScreen(data)),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => StepperScreen(data)),
            );
          }
        } else
          Navigator.pop(context);
      },
    );
    // ignore: deprecated_member_use
    // Widget signButton = FlatButton(
    //   child: Text("Sign up"),
    //   onPressed: () {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(builder: (context) => RegisterScreen()),
    //     );
    //   },
    // );
    // ignore: deprecated_member_use
    // Widget cancel = FlatButton(
    //   child: Text("Cancel"),
    //   onPressed: () {
    //     Navigator.pop(context);
    //   },
    // );
    AlertDialog alert;
    // if (code == 711) {
    setState(() {
      isOK = true;
    });
    alert = AlertDialog(
      content: Text("Logged in Successfully"),
      actions: [
        okButton,
      ],
    );
    // }
    // else if (code == 812) {
    //   alert = AlertDialog(
    //     content: Text("$message"),
    //     actions: [
    //       cancel,
    //       signButton,
    //     ],
    //   );
    // } else if (code == 901) {
    //   alert = AlertDialog(
    //     content: Text("$message"),
    //     actions: [
    //       okButton,
    //     ],
    //   );
    // }

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
