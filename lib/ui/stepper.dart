import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slark/bloc/space_bloc.dart';
import 'package:slark/bloc/workspace_bloc.dart';
import 'package:slark/model/dto_space.dart';
import 'package:slark/model/dto_user.dart';
import 'package:slark/model/dto_ws.dart';
import 'package:slark/model/user.dart';
import 'package:slark/model/workspace.dart';
import 'package:slark/ui/home.dart';
// import 'package:slark/ui/home.dart';
import 'package:slark/ui/splashScreen.dart';

class StepperScreen extends StatefulWidget {
  @override
  _StepperScreenState createState() => _StepperScreenState();

  final dynamic data;
  StepperScreen(this.data);
}

class _StepperScreenState extends State<StepperScreen> {
  static TextEditingController _spaceController = new TextEditingController();
  static TextEditingController _emailsController = TextEditingController();
  static TextEditingController _wsController = new TextEditingController();
  final WorkspaceBloc wkbloc = new WorkspaceBloc();
  final SpaceBloc spacebloc = new SpaceBloc();

  String emails = '';
  String workspace = '';
  String space = '';

  int currentStep = 0;
  bool complete = false;
  var workspaceData;
  var spaceData;
  var invitaionData;
  var addWorkspace = new Workspaces();
  var addSpace = new WorkspaceClass();
  var udto = new DtoUser();
  var wsdto = new DtoWS();
  var spacedto = new DtoSpace();

  @override
  void initState() {
    super.initState();

    _emailsController.addListener(_handleEmailsChanged);
    _spaceController.addListener(_handleSpaceChanged);
    _wsController.addListener(_handleWSChanged);
    udto.username = widget.data.user.name;
  }

  void _handleWSChanged() {
    this.workspace = _wsController.text;
  }

  void _handleEmailsChanged() {
    this.emails = _emailsController.text;
  }

  void _handleSpaceChanged() {
    this.space = _spaceController.text;
  }

  next() async {
    String workspaceId = '';
    List<String> email = [];

    if (currentStep != 3) {
      if (currentStep == 0) {
        if (workspace.isNotEmpty) {
          print('//STARTING CREATION REQUEST FROM UI');
          Map<String, dynamic> ws = {
            "name": workspace,
          };
          await wkbloc.createWorkspace(ws).then((value) {
            setState(() {
              workspaceId = value.id;
              workspaceData = value; // the response object
              wsdto.workspaceId = value.id;

              wsdto.workspacename = value.name;

              udto.workspaces.add(wsdto);

              Fluttertoast.showToast(
                  msg: value.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            });
          });
          goTo(currentStep + 1);
        }
      } else if (currentStep == 1) {
        if (emails.isNotEmpty) {
          email = emails.split(' ');

          for (var item in email) {
            print('//STARTING INVITAION REQUEST FROM UI');
            Map<String, dynamic> invite = {
              "workspaceName": workspaceData.name,
              "workspaceId": workspaceData.id,
              "userEmail": item
            };
            await wkbloc.invite(invite).then((value) {
              setState(() {
                invitaionData = value;
                Fluttertoast.showToast(
                    msg: value.message,
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.CENTER,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.red,
                    textColor: Colors.white,
                    fontSize: 16.0);
              });
            });
          }
        }
        goTo(currentStep + 1);
      } else if (currentStep == 2) {
        if (space.isNotEmpty) {
          print('//STARTING SPACE CREATION REQUEST FROM UI');
          Map<String, dynamic> newspace = {
            'name': space,
            '_workspace': workspaceData.id,
          };

          await spacebloc.createSpace(newspace).then((value) {
            print(value.message);
            setState(() {
              spaceData = value;
              spacedto.spaceId = value.id;

              spacedto.spacename = value.name;

              wsdto.spaces.add(spacedto);

              Fluttertoast.showToast(
                  msg: value.message,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0);
            });

            print('//REQUEST END IN STEPPER SCREEN//');
          });
        }

        showAlertDialog(context);
      }
    }
  }

  cancel() {
    if (currentStep > 0 || currentStep != 0) {
      goTo(currentStep - 1);
    }
  }

  goTo(int step) {
    setState(() => currentStep = step);
  }

  List<Step> steps = [
    Step(
      title: const Text(
        'Name your workspace',
      ),
      isActive: true,
      state: StepState.indexed,
      content: Column(
        children: <Widget>[
          TextFormField(
            controller: _wsController,
            decoration: InputDecoration(labelText: 'Workspace name'),
          ),
        ],
      ),
    ),
    Step(
      isActive: false,
      state: StepState.indexed,
      title: const Text('Invite people to Workspace'),
      subtitle: Text('People Emails'),
      content: Column(
        children: <Widget>[
          TextFormField(
            controller: _emailsController,
            decoration: InputDecoration(
                labelText: 'ex. person1@exapmle.com person2@example.com'),
          ),
        ],
      ),
    ),
    Step(
      state: StepState.indexed,
      title: const Text('Name your space'),
      subtitle: const Text("You may create one later"),
      content: Column(
        children: <Widget>[
          TextFormField(
            controller: _spaceController,
            decoration: InputDecoration(labelText: 'Your space name'),
          ),
        ],
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: <Widget>[
        SizedBox(
          height: 40.0,
        ),
        Text(
          'Welcome ${udto.username}',
          style: TextStyle(
            color: Colors.indigo,
            fontSize: 20,
          ),
        ),
        Expanded(
          child: Stepper(
            steps: steps,
            currentStep: currentStep,
            onStepContinue: next,
            onStepCancel: cancel,
          ),
        ),
      ]),
    );
  }

  showAlertDialog(BuildContext ctx) {
    // ignore: deprecated_member_use
    Widget button = FlatButton(
      child: Text("GO"),
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(data: udto, isStepper: true)),
        );
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text("Welcome"),
      content: Text("Enjoy Working with your Teams!"),
      actions: [
        button,
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
