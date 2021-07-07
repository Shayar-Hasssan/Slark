import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:slark/bloc/list_bloc.dart';
import 'package:slark/bloc/space_bloc.dart';
import 'package:slark/bloc/task_bloc.dart';
import 'package:slark/bloc/workspace_bloc.dart';
import 'package:slark/dto/dto_list.dart';
import 'package:slark/dto/dto_space.dart';
import 'package:slark/dto/dto_task.dart';
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
  // ignore: unused_field
  final _wsbloc = WorkspaceBloc();
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
    udto.username = widget.data.user.name;
    udto.email = widget.data.user.email;
    print(udto.username);
    print(udto.email);
    for (var wsItem in widget.data.user.workspaces) {
      print('Round $counter ');
      print('Printing the workspaces names');
      print(wsItem.name);

      // ignore: await_only_futures
      await setState(() {
        wsdto = new DtoWS();
        wsdto.workspaceId = wsItem.id;
        print(wsdto.workspaceId);
        wsdto.workspacename = wsItem.name;
        for (var role in widget.data.user.roles) {
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
              udto = new DtoUser();
              udto.email = user.email;
              udto.username = user.name;
              print(user.name);
            });
            wsdto.users.add(udto);
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
                      await _taskbloc.getAllTasks(listItem.id).then((value) {
                        if (value != null) if (value.length > 0) {
                          // ignore: deprecated_member_use
                          listdto.tasks = new List<DtoTask>();
                          for (var taskitem in value) {
                            setState(() {
                              taskdto = new DtoTask();
                              taskdto.id = taskitem.id;
                              taskdto.name = taskitem.name;
                              taskdto.assets = taskitem.assets;
                              taskdto.assignedUsers = taskitem.assignedUsers;
                              taskdto.comments = taskitem.comments;
                              taskdto.subtasks = taskitem.subtasks;
                            });
                            listdto.tasks.add(taskdto);
                            // }
                          }
                        }
                      });
                      spacedto.lists.add(listdto);
                    }
                  }
                },
              );
              wsdto.spaces.add(spacedto);
            }
          }
        },
      );

      counter++;
      udto.workspaces.add(wsdto);
    }

    // for (var item in udto.workspaces) {
    //   print('workspace: ${item.workspacename}');
    //   for (var item2 in item.spaces) {
    //     print('Space name: ${item2.spacename}');
    //     print('SpaceId : ${item2.spaceId}');
    //     for (var item3 in item2.lists) {
    //       print('listname: ${item3.name}');
    //       print('listId : ${item3.id}');
    //       for (var item4 in item3.tasks) {
    //         print('taskname: ${item4.name}');
    //         print('taskId : ${item4.id}');
    //       }
    //     }
    //   }
    //   print('_________');
    // }

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
