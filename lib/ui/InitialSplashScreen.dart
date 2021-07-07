import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:slark/bloc/account_bloc.dart';
import 'package:slark/bloc/list_bloc.dart';
import 'package:slark/bloc/space_bloc.dart';
import 'package:slark/bloc/task_bloc.dart';
import 'package:slark/bloc/workspace_bloc.dart';
import 'package:slark/dto/dto_list.dart';
import 'package:slark/dto/dto_space.dart';
import 'package:slark/dto/dto_task.dart';
import 'package:slark/dto/dto_user.dart';
import 'package:slark/dto/dto_ws.dart';
import 'package:slark/globals.dart';
import 'package:slark/ui/home.dart';
import 'package:slark/ui/landing.dart';

class InitialSplashScreen extends StatefulWidget {
  @override
  _InitialSplashScreenState createState() => _InitialSplashScreenState();
  final data;
  InitialSplashScreen(this.data);
}

class _InitialSplashScreenState extends State<InitialSplashScreen> {
  // SpaceBloc spaceBloc;
  // ignore: unused_field
  final _wsbloc = WorkspaceBloc();
  final _bloc = AccountBloc();
  final _spacebloc = SpaceBloc();
  final _listbloc = ListBloc();
  final _taskbloc = TaskBloc();
  var udto = new DtoUser();
  var wsdto = new DtoWS();
  var spacedto = new DtoSpace();
  var listdto = new DtoList();
  var taskdto = new DtoTask();

  @override
  void initState() {
    super.initState();
    getData();
    print('INIIIT ENNDDD');
  }

  getData() async {
    print('In getdata function');
    int counter = 0;
    await _bloc.getUserData(widget.data).then((value) async {
      print("****************");
      if (value != null) {
        print("numbers" + value.workspaces.length.toString());
        udto.username = value.name;
        udto.email = value.email;
        print(udto.username);
        print(udto.email);
        for (var wsItem in value.workspaces) {
          print('Round $counter ');
          print('Printing the workspaces names');
          print(wsItem.name);
          // ignore: await_only_futures
          await setState(() {
            wsdto = new DtoWS();
            wsdto.workspaceId = wsItem.id;
            print(wsdto.workspaceId);
            wsdto.workspacename = wsItem.name;

            for (var role in value.roles) {
              if (wsItem.id == role.targetId) {
                wsdto.roleName = role.name;
                wsdto.roleNum = role.number;
                print(role.name);
              }
            }
          });
          await _wsbloc.getAllUserInWs(wsItem.id).then((value) {
            if (value.length > 0) {
              for (var user in value) {
                setState(() {
                  var wkspudto = new DtoUser();
                  wkspudto.email = user.email;
                  wkspudto.username = user.name;
                  print(user.name);
                  wsdto.users.add(wkspudto);
                });
              }
            }
          });
          await _spacebloc.getAllSpaces(wsItem.id).then(
            (value) async {
              if (value.length > 0) {
                for (var spaceItem in value) {
                  setState(() {
                    spacedto = new DtoSpace();
                    spacedto.spaceId = spaceItem.id;
                    spacedto.spacename = spaceItem.name;
                  });
                  await _listbloc.getAllLists(spaceItem.id).then(
                    (value) async {
                      if (value.length > 0) {
                        for (var listItem in value) {
                          setState(() {
                            listdto = new DtoList();
                            listdto.id = listItem.id;
                            listdto.name = listItem.name;

                            print('--- $listItem');
                            print('==== ${listdto.name}');
                          });
                          await _taskbloc
                              .getAllTasks(listItem.id)
                              .then((value) {
                            print("the taskblocklength" +
                                value.length.toString());
                            if (value != null) if (value.length > 0) {
                              // ignore: deprecated_member_use
                              listdto.tasks = new List<DtoTask>();
                              for (var taskitem in value) {
                                setState(() {
                                  taskdto = new DtoTask();
                                  taskdto.id = taskitem.id;
                                  taskdto.name = taskitem.name;
                                  taskdto.assets = taskitem.assets;
                                  taskdto.assignedUsers =
                                      taskitem.assignedUsers;
                                  taskdto.comments = taskitem.comments;
                                  taskdto.subtasks = taskitem.subtasks;
                                  listdto.tasks.add(taskdto);
                                });
                              }
                            }
                          });
                          setState(() {
                            spacedto.lists.add(listdto);
                          });
                        }
                      }
                    },
                  );
                  setState(() {
                    wsdto.spaces.add(spacedto);
                  });
                }
              }
            },
          );
          counter++;
          setState(() {
            udto.workspaces.add(wsdto);
          });
        }
      } else {
        print("****************shero");
      }
    });
    print("numbers1");
    print(udto.workspaces.length.toString());
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
                height: 120.0,
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
