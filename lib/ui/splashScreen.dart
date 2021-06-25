import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:slark/bloc/space_bloc.dart';
import 'package:slark/bloc/workspace_bloc.dart';
import 'package:slark/dto/dto_list.dart';
import 'package:slark/dto/dto_space.dart';
import 'package:slark/dto/dto_user.dart';
import 'package:slark/dto/dto_ws.dart';
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
  var listdto = new DtoList();

  @override
  void initState() {
    super.initState();
    getData();
    print('INIIIT ENNDDD');
  }

  getData() async {
    int scount = 0;
    print('In getdata function');
    int counter = 0;
    int count = 0;
    udto.username = widget.data.user.name;
    udto.email = widget.data.user.email;
    print(udto.username);
    print(udto.email);
    for (var item in widget.data.user.workspaces) {
      print('Round $counter ');
      print('Printing the workspaces names');
      print(item.name);
      // ignore: await_only_futures
      await setState(() {
        wsdto = new DtoWS();

        wsdto.workspaceId = item.id;
        print(wsdto.workspaceId);
        wsdto.workspacename = item.name;
        // udto.workspaces.add(wsdto);
      });

      await _wsbloc.getWS(item.id).then(
        (value) async {
          for (var item2 in value.workspace.spaces) {
            setState(() {
              spacedto = new DtoSpace();
              spacedto.spaceId = item2;
              spacedto.spacename = 'Space $scount $counter';
              scount++;
            });

            await _spacebloc.getSpace(item2).then(
              (value) {
                for (var listItem in value.space.lists) {
                  setState(() {
                    listdto = new DtoList();
                    listdto.id = listItem;
                    listdto.name = 'list $count ${spacedto.spacename}';

                    print('--- $listItem');
                    print('==== ${listdto.name}');
                    count++;
                  });
                  spacedto.lists.add(listdto);
                }
              },
            );
            wsdto.spaces.add(spacedto);
          }
        },
      );

      counter++;
      udto.workspaces.add(wsdto);
    }

    for (var item in udto.workspaces) {
      print('workspace: ${item.workspacename}');
      for (var item2 in item.spaces) {
        print('Space name: ${item2.spacename}');
        print('SpaceId : ${item2.spaceId}');
        for (var item3 in item2.lists) {
          print('listname: ${item3.name}');
          print('listId : ${item3.id}');
        }
      }
      print('_________');
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
