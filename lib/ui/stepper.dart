import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:slark/bloc/workspace_bloc.dart';
import 'package:slark/ui/home.dart';

class StepperScreen extends StatefulWidget {
  @override
  _StepperScreenState createState() => _StepperScreenState();
}

class _StepperScreenState extends State<StepperScreen> {
  static TextEditingController _spaceController = new TextEditingController();
  static TextEditingController _emailsController = TextEditingController();
  static TextEditingController _wsController = new TextEditingController();
  final WorkspaceBloc wkbloc = new WorkspaceBloc();

  String emails = '';
  String workspace = '';
  String space = '';

  int currentStep = 0;
  bool complete = false;

  @override
  void initState() {
    super.initState();

    _emailsController.addListener(_handleEmailsChanged);
    _spaceController.addListener(_handleSpaceChanged);
    _wsController.addListener(_handleWSChanged);
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
    print(currentStep);
    if (currentStep + 1 != steps.length) {
      if (currentStep == 0) {
        if (workspace.isNotEmpty) {
          Map<String, dynamic> ws = {
            "name": workspace,
          };
          await wkbloc.createWorkspace(ws).then((value) {
            Fluttertoast.showToast(
                msg: value.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.CENTER,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.red,
                textColor: Colors.white,
                fontSize: 16.0);
          });
          goTo(currentStep + 1);
        }
      } else if (currentStep == 1) {
        goTo(currentStep + 1);
      } else if (currentStep == 2) {
        goTo(currentStep + 1);
      }
    } else {
      showAlertDialog(context);
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
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
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
