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
    print('In getdata function');
    int counter = 0;
    udto.username = widget.data.user.name;
    print(udto.username);

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

      await _wsbloc.getWS(item.id).then((value) async {
        for (var item2 in value.workspace.spaces) {
          setState(() {
            spacedto = new DtoSpace();
            spacedto.spaceId = item2;
            spacedto.spacename = 'Space $counter';
            wsdto.spaces.add(spacedto);
            // udto.workspaces.add(wsdto);
          });

          await _spacebloc.getSpace(item2).then((value) {
            for (var listItem in value.space.lists) {
              setState(() {
                listdto = new DtoList();
                listdto.id = listItem;
                listdto.name = 'list $counter';
                spacedto.lists.add(listdto);
                print('--- $listItem');
                print('==== ${listdto.name}');
              });
            }
          });
          wsdto.spaces.add(spacedto);
        }
      });
      counter++;
      udto.workspaces.add(wsdto);
    }

    for (var item in udto.workspaces) {
      for (var item2 in item.spaces) {
        print('======');
        print(item2.spacename);
        print(item2.spaceId);
        print('_________');
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

/////////////////////
  // await _wsbloc.getWS(item1.id).then((value) async {
  //   print(value);

  //   for (var item in value.workspace.spaces) {
  //     setState(() {
  //       spacedto.spaceId = item;
  //     });
  //   }
  // wsdto.spaces.add(spacedto);
  // udto.workspaces.add(wsdto);
  // print('spacedto.spaceId ${spacedto.spaceId}');
  // });
  // }
  // for (var item in udto.workspaces) {
  //   for (var item1 in item.spaces) {
  //     await _spacebloc.getSpace(item1.spaceId).then((value) {

  //     });
  //   }
  // }

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
