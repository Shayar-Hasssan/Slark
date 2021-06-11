import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:slark/ui/login.dart';
import 'package:slark/ui/register.dart';

class LandingUi extends StatefulWidget {
  @override
  _LandingUiState createState() => _LandingUiState();
}

class _LandingUiState extends State<LandingUi> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Scaffold(
          backgroundColor: Colors.blueGrey[50],
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 70.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(
                    'images/logo.png',
                    height: 160.0,
                    width: 160.0,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    'Welcome to SLARK!',
                    style: TextStyle(
                      fontFamily: 'Aviliator',
                      color: Color(0xff7b68ee),
                      fontSize: 30.0,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Divider(
                    color: Color(0xff7b68ee),
                    thickness: 0.5,
                    indent: 50.0,
                    endIndent: 50.0,
                  ),
                  SizedBox(
                    height: 50.0,
                  ),
                  SignInButtonBuilder(
                    text: '     Sign in with Email',
                    icon: Icons.email,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterScreen()));
                    },
                    padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    elevation: 10.0,
                    backgroundColor: Color(0xff697ffb),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 270.0,
                  ),
                  SizedBox(height: 15.0),
                  SizedBox(
                    height: 10.0,
                  ),
                  SignInButtonBuilder(
                    text: '     Login to your account',
                    icon: Icons.email,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginScreen()),
                      );
                    },
                    padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    elevation: 10.0,
                    backgroundColor: Color(0xff697ffb),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    width: 270.0,
                  ),
                  SizedBox(height: 15.0),
                  SizedBox(
                    height: 10.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
