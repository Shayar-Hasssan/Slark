import 'package:flutter/material.dart';
import 'package:slark/bloc/registration_bloc.dart';
import 'package:slark/model/user.dart';
import 'package:slark/ui/register.dart';
import 'package:slark/ui/splashScreen.dart';

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
                        onEditingComplete: () {
                          print('email $email');
                        },
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
                        onEditingComplete: () {
                          print('password $password');
                        },
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
                            print(login);
                            await _bloc.loginAcc(login).then((value) {
                              setState(() {
                                message = value.message;
                              });
                              showAlertDialog(context, message, value.user);
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

  showAlertDialog(BuildContext ctx, String message, User user) {
    // Create button
    // ignore: deprecated_member_use
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SplashScreen()),
        );
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Hello ${user.name}"),
      content: Text("$message"),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
