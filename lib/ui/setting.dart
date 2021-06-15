import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String email = 'usr_email@somehting.com';
  String password = 'Enter new password';
  String username = 'John Doe';

  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _nameController = TextEditingController();

    _emailController.addListener(_handleEmailChanged);
    _passwordController.addListener(_handlePassChanged);
    _nameController.addListener(_handleUsernameChanged);
  }

  void _handleEmailChanged() {
    this.email = _emailController.text;
  }

  void _handlePassChanged() {
    this.password = _passwordController.text;
  }

  void _handleUsernameChanged() {
    this.username = _nameController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SLARK'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.done),
          ),
        ],
        backgroundColor: Color(0xff7b68ee),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height - 100,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(
                  height: 15.0,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.indigo[50],
                    foregroundColor: Colors.black,
                    radius: 60.0,
                    child: Icon(
                      Icons.person,
                      size: 90.0,
                    ),
                  ),
                ),
                SizedBox(height: 30.0),
                Text(
                  '$username',
                  style: TextStyle(
                      fontSize: 18, color: Colors.indigo, letterSpacing: 10.0),
                ),
                SizedBox(height: 120.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Container(
                        height: 50.0,
                        child: TextFormField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            hintText: '$username',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff7b68ee),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Container(
                        height: 50.0,
                        child: TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: '$email',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff7b68ee),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Container(
                        height: 50.0,
                        child: TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: '$password',
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xff7b68ee),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
