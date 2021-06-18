import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:slark/bloc/space_bloc.dart';
import 'package:slark/bloc/workspace_bloc.dart';
import 'package:slark/model/dto_space.dart';
import 'package:slark/model/dto_user.dart';
import 'package:slark/model/dto_ws.dart';
import 'package:slark/ui/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
  final data;
  SplashScreen(this.data);
}

class _SplashScreenState extends State<SplashScreen> {
  // SpaceBloc spaceBloc;
  final _wsbloc = WorkspaceBloc();
  final _spacebloc = SpaceBloc();
  var udto = new DtoUser();
  var wsdto = new DtoWS();
  var spacedto = new DtoSpace();

  @override
  void initState() {
    super.initState();
    getData();
    print('INIIIT ENNDDD');
  }

  getData() async {
    udto.username = widget.data.user.name;

    for (var item1 in widget.data.user.workspaces) {
      print(item1.id);
      setState(() {
        wsdto.workspaceId = item1.id;
        wsdto.workspacename = item1.name;
      });

      print('00000000');
      for (var item in udto.workspaces) {
        print(item.workspacename);
      }
      print('>>>>>>>>>');
      // print(udto.workspaces);
      await _wsbloc.getWS(item1.id).then((value) async {
        print(value);

        for (var item in value.workspace.spaces) {
          setState(() {
            spacedto.spaceId = item;
          });
        }
        wsdto.spaces.add(spacedto);
        udto.workspaces.add(wsdto);
        print('spacedto.spaceId ${spacedto.spaceId}');
      });
    }
    // for (var item in udto.workspaces) {
    //   for (var item1 in item.spaces) {
    //     await _spacebloc.getSpace(item1.spaceId).then((value) {

    //     });
    //   }
    // }
    print('USERNAME ${udto.username}');
    for (var item in udto.workspaces) {
      print('WS ${item.workspacename}');
      print('WS ${item.workspaceId}');
      for (var item1 in item.spaces) {
        print('SPACE ${item1.spaceId}');
      }
    }
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeScreen(
          data: udto,
          isStepper: false,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff7b68ee),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 150.0,
              ),
              Text(
                'Slark',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Aviliator',
                    fontWeight: FontWeight.bold,
                    fontSize: 60.0),
              ),
              SizedBox(
                height: 85.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Please wait a moment!',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'AdventPro',
                        fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  SpinKitFoldingCube(
                    color: Colors.white,
                    size: 70.0,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
