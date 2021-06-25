import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slark/bloc/account_bloc.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
  final data;
  SettingScreen({Key key, this.data}) : super(key: key);
}

class _SettingScreenState extends State<SettingScreen> {
  String email;
  String password = 'Enter new password';
  String username;
  String passwordConfirm;
  AccountBloc _accbloc = AccountBloc();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  static TextEditingController _confirmController = TextEditingController();

  @override
  void initState() {
    super.initState();
    username = '${widget.data.username}';
    email = '${widget.data.email}';

    _emailController.addListener(_handleEmailChanged);
    _passwordController.addListener(_handlePassChanged);
    _nameController.addListener(_handleUsernameChanged);
    _confirmController.addListener(_handleConfirmChanged);
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

  void _handleConfirmChanged() {
    this.passwordConfirm = _confirmController.text;
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
          height: MediaQuery.of(context).size.height,
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
                          obscureText: true,
                          obscuringCharacter: '*',
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
                ),
                SizedBox(
                  height: 15.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // ignore: deprecated_member_use
                    FlatButton(
                        onPressed: () async {
                          await _asyncConfirmDialog(context);
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                            ),
                            Text(
                              'Delete Account',
                              style: TextStyle(color: Colors.red),
                            ),
                          ],
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _asyncConfirmDialog(BuildContext context) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm account Deletion',
            style: TextStyle(color: Colors.indigo),
          ),
          content: Container(
            height: 100,
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextFormField(
                  controller: _confirmController,
                  decoration: InputDecoration(
                    hintText: 'Enter you password',
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Color(0xff7b68ee),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: const Text(
                'Cancel',
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {
                Navigator.of(context).pop(context);
              },
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: const Text(
                'Delete',
                style: TextStyle(color: Colors.red, fontSize: 16.0),
              ),
              onPressed: () async {
                var userdata = {"email": email, "password": passwordConfirm};
                await _accbloc.deleteAcc(userdata).then((value) {});
                // Navigator.of(context).pop(ConfirmAction.Accept);
              },
            )
          ],
        );
      },
    );
  }
}
