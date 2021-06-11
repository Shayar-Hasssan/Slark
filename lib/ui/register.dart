import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:slark/bloc/registration_bloc.dart';
import 'package:slark/ui/login.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _emailController;
  TextEditingController _passwordController;
  TextEditingController _usernameController;

  String username = '';
  String email = '';
  String password = '';
  String message = '';
  Map<String, String> register;
  final _bloc = AccountBloc();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _usernameController = TextEditingController();

    _emailController.addListener(_handleEmailChanged);
    _passwordController.addListener(_handlePassChanged);
    _usernameController.addListener(_handleUsernameChanged);
  }

  void _handleEmailChanged() {
    this.email = _emailController.text;
  }

  void _handlePassChanged() {
    this.password = _passwordController.text;
  }

  void _handleUsernameChanged() {
    this.username = _usernameController.text;
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
                    height: 80.0,
                  ),
                  Text(
                    'Register',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Color(0xff7b68ee),
                      fontFamily: 'Aviliator',
                    ),
                  ),
                  Divider(
                    color: Color(0xff7b68ee),
                    thickness: 0.5,
                    indent: 160.0,
                    endIndent: 160.0,
                  ),
                  SizedBox(height: 40.0),
                  SizedBox(
                    height: 60.0,
                    width: 340.0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
                  SizedBox(height: 25.0),
                  SizedBox(
                    height: 80.0,
                    width: 340.0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'John Doe',
                          labelText: 'Username',
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
                        controller: _usernameController,
                        onEditingComplete: () {
                          print('username $username');
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  SizedBox(
                    height: 60.0,
                    width: 350.0,
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
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
                  SizedBox(height: 20.0),
                  SizedBox(
                    height: 50.0,
                    width: 300.0,
                    // ignore: deprecated_member_use
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                      child: Container(
                        // ignore: deprecated_member_use
                        child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(80.0)),
                          padding: EdgeInsets.all(0.0),
                          color: Color(0xff7b68ee),
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            child: Container(
                              constraints: BoxConstraints(
                                maxWidth: 300.0,
                                minHeight: 50.0,
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                'Register',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  letterSpacing: 1.0,
                                ),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            register = {
                              'name': username,
                              'email': email,
                              'password': password
                            };
                            int code;
                            print(register);
                            await _bloc.registerAcc(register).then((value) {
                              setState(() {
                                message = value.message;
                                code = value.code;
                              });
                              showAlertDialog(context, code, message);
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 0.0, 0.0),
                    // ignore: deprecated_member_use
                    child: FlatButton(
                      child: Text(
                        'Already have an account? Login',
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
                              builder: (context) => LoginScreen()),
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

  showAlertDialog(BuildContext ctx, int code, String message) {
    // Create button
    // ignore: deprecated_member_use
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    );
    AlertDialog alert;
    if (code == 711) {
      // Create AlertDialog
      alert = AlertDialog(
        title: Text("Verification"),
        content: Text("$message"),
        actions: [
          okButton,
        ],
      );
    } else {
      alert = AlertDialog(
        content: Text("$message"),
        actions: [
          okButton,
        ],
      );
    }

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
