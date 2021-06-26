import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slark/bloc/list_bloc.dart';
import 'package:slark/bloc/space_bloc.dart';
import 'package:slark/bloc/task_bloc.dart';
import 'package:slark/bloc/workspace_bloc.dart';
import 'package:slark/dto/dto_list.dart';
import 'package:slark/dto/dto_space.dart';
import 'package:slark/dto/dto_user.dart';
import 'package:slark/dto/dto_ws.dart';
import 'package:slark/ui/listInfo.dart';
import 'package:slark/ui/profile.dart';
import 'package:slark/ui/setting.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
  final data;
  final bool isStepper;
  const HomeScreen({Key key, this.data, this.isStepper}) : super(key: key);
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _workspaceEditController = TextEditingController();
  TextEditingController _spaceEditController = TextEditingController();
  TextEditingController _newTaskController = TextEditingController();
  TextEditingController _newListController = TextEditingController();
  TextEditingController _newspaceController = TextEditingController();
  TextEditingController _newWSpaceController = TextEditingController();

  final _wsbloc = WorkspaceBloc();
  final _spacebloc = SpaceBloc();
  final _listbloc = ListBloc();
  final _taskbloc = TaskBloc();
  var wsdto = new DtoWS();
  var spacedto = new DtoSpace();
  var listdto = new DtoList();
  var udto = new DtoUser();

  String newTask = '';
  String newWSName = '';
  String newSpaceName = '';
  // String newList = '';
  List<DtoSpace> spacesmenuItem = [];
  List<DtoList> listsItems = [];
  String selectedSpace = 'choose space';
  List<String> tasks = ['task1'];

  String selectedWorkspace;
  bool isWorkspace;
  String selectedList; // selected to create new task
  var newspace;
  bool isExpand;
  var selectedWSId;
  var selectedSpaceId;

  @override
  // ignore: must_call_super
  initState() {
    print('AT HOME SCREEN');
    setDefault();
    setState(() {
      isWorkspace = false;
      isExpand = false;
    });
  }

  setDefault() async {
    setState(() {
      selectedWorkspace = widget.data.workspaces.first.workspacename;
      selectedWSId = widget.data.workspaces.first.workspaceId;
    });
    for (var wsItem in widget.data.workspaces) {
      if (wsItem.workspaceId == selectedWSId) {
        for (var item in wsItem.spaces) {
          spacesmenuItem.add(item);
        }
        setState(() {
          selectedSpace = wsItem.spaces.first.spacename;
          selectedSpaceId = wsItem.spaces.first.spaceId;
        });
      }
      for (var spaceItem in wsItem.spaces) {
        if (spaceItem.spaceId == selectedSpaceId) {
          for (var listItem in spaceItem.lists) {
            setState(() {
              listsItems.add(listItem);
            });
          }
        }
      }
    }
    print('DEFAULT WS: $selectedWorkspace');
    print('DEFAULT Space: $selectedSpace');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xff7b68ee)),
              padding: EdgeInsets.only(right: 40, top: 8.0),
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileScreen()),
                              );
                            },
                            icon: Icon(Icons.person_rounded),
                            iconSize: 70.0,
                            color: Colors.white,
                          ),
                          Text(
                            '${widget.data.username}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'AdventPro'),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            '${widget.data.role}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontFamily: 'AdventPro'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            ExpansionPanelList(
              elevation: 0,
              expansionCallback: (int index, bool isExpanded) {},
              children: [
                ExpansionPanel(
                  backgroundColor: Colors.white12,
                  canTapOnHeader: true,
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      leading: Icon(
                        Icons.workspaces_filled,
                        color: Colors.black,
                        size: 20.0,
                      ),
                      title: Text(
                        'Workspace Spaces',
                        style: TextStyle(fontSize: 17.0),
                      ),
                      subtitle: Text(
                        selectedSpace,
                        style: TextStyle(color: Colors.indigo),
                      ),
                      onTap: () {
                        setState(() {
                          isExpand = !isExpanded;
                        });
                      },
                    );
                  },
                  body: Container(
                    height: 200.0,
                    child: spaceList(),
                  ),
                  isExpanded: isExpand,
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              onTap: () {
                setState(() {
                  isWorkspace = true;
                });

                showModal();
              },
              leading: Icon(
                Icons.group_work,
                color: Colors.black,
                size: 28.0,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Workspace',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  IconButton(
                    onPressed: () {
                      //TODO _newWSDialog()
                      createNewWorkspace(context);
                    },
                    icon: Icon(
                      Icons.add,
                      size: 20.0,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                "$selectedWorkspace",
                style: TextStyle(color: Colors.indigo),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Divider(
              thickness: 1.0,
              indent: 100.0,
              endIndent: 100.0,
              color: Colors.indigo[100],
            ),
            SizedBox(
              height: 40.0,
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.black,
                size: 20.0,
              ),
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 16.0),
              ),
              onTap: () async {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingScreen(data: widget.data)),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color(0xff7b68ee),
        elevation: 0.0,
        toolbarHeight: 68.0,
        title: Text(
          'SLARK',
          style: TextStyle(
            fontFamily: 'AdventPro',
            fontSize: 30.0,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: IconButton(
              onPressed: () {
                _newTaskDialog(context, listsItems, _newTaskController);
              },
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: listsWidget(),
      ),
    );
  }

  showModal() {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.black38,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      builder: (BuildContext context) {
        const double height = 500;

        return Container(
          color: Color(0xff7b68ee),
          height: height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Container(
                  height: 350.0,
                  color: Colors.indigo[50],
                  child: workspaceList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  workspaceList() {
    List<Widget> buttons = [];
    for (var item in widget.data.workspaces) {
      buttons.add(
        Container(
          child: ListTile(
            onTap: () {
              print('------- ${item.workspaceId}');
              setState(() {
                selectedWSId = item.workspaceId;
                selectedWorkspace = item.workspacename;
                spacesmenuItem = <DtoSpace>[];
                listsItems = <DtoList>[];
              });
              for (var item in widget.data.workspaces) {
                if (item.workspaceId == selectedWSId) {
                  print('HELLO THERE');
                  print(selectedWSId);
                  print(selectedWorkspace);
                  if (item.spaces.length > 0) {
                    for (var spaceitem in item.spaces) {
                      print('**********');
                      print(spaceitem.spaceId);
                      setState(() {
                        spacesmenuItem.add(spaceitem);
                        selectedSpace = spacesmenuItem.first.spacename;
                        selectedSpaceId = spacesmenuItem.first.spaceId;
                      });
                      if (spaceitem.spaceId == selectedSpaceId) {
                        for (var listItem in spaceitem.lists) {
                          setState(() {
                            listsItems.add(listItem);
                          });
                        }
                      }
                    }
                  } else
                    setState(() {
                      selectedSpace = 'No Spaces Yet';
                    });
                }
              }
              Navigator.pop(context);
            },
            leading: Text(
              '${item.workspacename}',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'AdventPro',
                fontSize: 18.0,
              ),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () async {
                    if (isWorkspace) {
                      print(item.workspacename);
                      print(item.workspaceId);
                      _editNameDialog(
                          context: context,
                          controller: _workspaceEditController,
                          wsId: item.workspaceId);
                      setState(() {
                        item.workspacename = newWSName;
                      });
                    }
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.indigo,
                    size: 18.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    // ignore: unused_local_variable
                    var deldata = {
                      'id': item.workspaceId,
                    };
                    await _asyncConfirmDialog(
                        context: context,
                        action: DeleteAction.Workspace,
                        reqdata: deldata);
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red[800],
                    size: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
      child: Container(
        child: ListView(
          children: buttons,
        ),
      ),
    );
  }

  spaceList() {
    List<Widget> buttons = [];
    if (spacesmenuItem.length > 0) {
      for (var item in spacesmenuItem) {
        buttons.add(
          Container(
            child: ListTile(
              onTap: () {
                print('-==== ${item.spaceId}');
                print('-==== ${item.spacename}');
                setState(() {
                  selectedSpace = item.spacename;
                  selectedSpaceId = item.spaceId;
                  listsItems = <DtoList>[];
                });
                for (var sitem in spacesmenuItem) {
                  if (selectedSpaceId == sitem.spaceId) {
                    print('HELLO From listsWidget');
                    print(selectedSpaceId);
                    print(selectedSpace);
                    if (sitem.lists.length > 0) {
                      for (var listitem in sitem.lists) {
                        print('**********');
                        print(listitem.id);
                        setState(() {
                          listsItems.add(listitem);
                        });
                      }
                    }
                  }
                }

                Navigator.pop(context);
              },
              leading: Text(
                '${item.spacename}',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'AdventPro',
                  fontSize: 18.0,
                ),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      if (isWorkspace) {
                        await _editNameDialog(
                            context: context,
                            controller: _spaceEditController,
                            spaceId: item.spaceId,
                            wsId: selectedWSId);
                        setState(() {
                          item.spacename = newSpaceName;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.indigo,
                      size: 18.0,
                    ),
                  ),
                  IconButton(
                    onPressed: () async {
                      // ignore: unused_local_variable
                      var deldata = {
                        'id': item.spaceId,
                      };
                      await _asyncConfirmDialog(
                          context: context,
                          action: DeleteAction.Space,
                          reqdata: deldata);
                    },
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[800],
                      size: 20.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }
    }
    buttons.add(
      Container(
          child: ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.add,
              color: Colors.indigo[600],
              size: 15.0,
            ),
            Text(
              'Add new space',
              style: TextStyle(color: Colors.indigo[600]),
            ),
          ],
        ),
        onTap: () {
          createNewSpace(context);
        },
      )),
    );
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
      child: Container(
        child: ListView(
          children: buttons,
        ),
      ),
    );
  }

  listsWidget() {
    List<Widget> myWidget = [];
    if (listsItems.length <= 0) {
      myWidget.add(Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("All your Space lists and tasks are here"),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add a new task press"),
                IconButton(
                  onPressed: () async {
                    //TODO Edit;
                    await _newTaskDialog(
                        context, listsItems, _newTaskController);
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ));
    } else {
      for (var listItem in listsItems) {
        myWidget.add(Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 60.0,
                child: Card(
                  color: Colors.indigo[100],
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0, left: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${listItem.name}',
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.start,
                        ),
                        IconButton(
                            onPressed: () {
                              // DtoList dtoList
                              print('||||| ${listItem.name}');
                              print('||||${listItem.id}');

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ListInfo(data: listItem),
                                  ));
                            },
                            icon: Icon(
                              Icons.info_outline,
                              color: Colors.grey[600],
                            ))
                      ],
                    ),
                  ),
                ),
              ),
            ]));
      }
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          height: (MediaQuery.of(context).size.height),
          color: Colors.indigo[50],
          child: ListView(
            children: myWidget,
          ),
        ),
      );
    }
  }

  _editNameDialog({BuildContext context, controller, spaceId, wsId}) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Edit Name'),
            content: TextField(
              controller: controller,
              decoration: InputDecoration(hintText: "Enter new name"),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              new FlatButton(
                child: new Text('SUBMIT'),
                onPressed: () async {
                  // var updateWS = {};
                  if (!isWorkspace) {
                    setState(() {
                      newWSName = controller.text;
                    });
                    print('NEW WS NAME IS $newWSName');
                    print("Controller Value is ${controller.text}");
                  } else {
                    setState(() {
                      newSpaceName = controller.text;
                    });
                    var updateSpace = {
                      "id": spaceId,
                      "workspaceId": wsId,
                      "data": {"name": newSpaceName}
                    };
                    print(updateSpace);
                    await _spacebloc.updateSpace(updateSpace).then((value) {
                      print(value.code);
                      print(value.message);
                      Navigator.of(context).pop();
                    });
                    print('NEW Space NAME IS $newSpaceName');
                    print("Controller Value is ${controller.text}");
                    for (var witem in widget.data.workspaces) {
                      if (witem.workspaceId == wsId) {
                        for (var sitem in witem.spaces) {
                          if (sitem.spaceId == spaceId) {
                            setState(() {
                              sitem.spacename = newSpaceName;
                            });
                          }
                        }
                      }
                    }
                  }
                },
              )
            ],
          );
        });
  }

  _newTaskDialog(
      BuildContext context, List<DtoList> listOfLists, controller) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            contentPadding: EdgeInsets.only(left: 60, right: 60.0),
            title: Text(
              'Create Task',
              style: TextStyle(
                color: Colors.indigo,
                fontSize: 24.0,
                letterSpacing: 3.0,
              ),
            ),
            content: Container(
              height: 200.0,
              width: 350.0,
              child: Column(
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    width: 400.0,
                    color: Colors.indigo[50],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          listOfLists.isNotEmpty
                              ? DropdownButton(
                                  items: listOfLists.map(
                                    (item) {
                                      return DropdownMenuItem(
                                          value: item,
                                          child: Text(
                                            '${item.name}',
                                            overflow: TextOverflow.ellipsis,
                                            softWrap: true,
                                          ));
                                    },
                                  ).toList(),
                                  onChanged: (val) {
                                    setState(() {
                                      selectedList = val;
                                    });
                                  },
                                  value: selectedList,
                                )
                              : IconButton(
                                  onPressed: createNewList(context),
                                  icon: Icon(Icons.add),
                                ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              createNewList(context);
                            },
                            child: Text(
                              'Or create new',
                              overflow: TextOverflow.ellipsis,
                              softWrap: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),
                  TextField(
                    controller: controller,
                    decoration: InputDecoration(hintText: "Enter Task name"),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              // ignore: deprecated_member_use
              new FlatButton(
                child: new Text(
                  'SUBMIT',
                  style: TextStyle(color: Colors.indigo, fontSize: 16),
                ),
                onPressed: () async {
                  setState(() {
                    newTask = controller.text;
                  });

                  print('Controller Value ${controller.text}');
                  print('New Task Name is $newTask');
                  tasks.add(newTask);
                  for (var item in tasks) {
                    print('Tasks list items $item');
                  }
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  createNewList(BuildContext ctx) {
    var newList;
    // ignore: deprecated_member_use
    Widget submit = FlatButton(
      child: Text(
        "Submit",
      ),
      onPressed: () async {
        newList = _newListController.text;
        Map<String, dynamic> listnew = {
          "name": newList,
          "_space": selectedSpaceId,
        };
        print(listnew);
        await _listbloc.createList(listnew).then((value) {
          print('++++++++');
          print(value.message);
          final snackBar = SnackBar(
            content: Text('${value.message}'),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            behavior: SnackBarBehavior.floating,
            width: 300,
          );
          if (value.code == 711) {
            listdto = new DtoList();
            listdto.id = value.list.id;
            listdto.name = value.list.name;
            for (var ws in widget.data.workspaces) {
              if (ws.workspaceId == selectedWSId) {
                for (var space in ws.spaces) {
                  if (space.spaceId == selectedSpaceId) {
                    space.lists.add(listdto);
                  }
                }
              }
            }
            listsItems.add(listdto);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          Navigator.pop(context);
        });

        // setState(() {
        //   newList = _newListController.text;
        // });
        // //TODO
        // // listsItems.add(newList);

        // setState(() {
        //   selectedList = newList;
        // });

        _newTaskDialog(context, listsItems, _newTaskController);
      },
    );
    AlertDialog alert;

    alert = AlertDialog(
      title: Text("New List"),
      content: TextField(
        controller: _newListController,
      ),
      actions: [
        submit,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  createNewSpace(BuildContext ctx) {
    var newSpace;
    // ignore: deprecated_member_use
    Widget submit = FlatButton(
      child: Text(
        "Submit",
      ),
      onPressed: () async {
        newSpace = _newspaceController.text;
        Map<String, dynamic> spacenew = {
          "_workspace": selectedWSId,
          "name": newSpace
        };
        print(spacenew);
        await _spacebloc.createSpace(spacenew).then((value) {
          print('++++++++');
          print(value.message);
          final snackBar = SnackBar(
            content: Text('${value.message}'),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            behavior: SnackBarBehavior.floating,
            width: 300,
          );
          if (value.code == 711) {
            spacedto = new DtoSpace();
            spacedto.spaceId = value.id;
            spacedto.spacename = value.name;
            for (var ws in widget.data.workspaces) {
              if (ws.workspaceId == selectedWSId) {
                ws.spaces.add(spacedto);
              }
            }
            spacesmenuItem.add(spacedto);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          Navigator.pop(context);
        });
      },
    );
    AlertDialog alert;

    alert = AlertDialog(
      title: Text("New Space"),
      content: TextField(
        controller: _newspaceController,
      ),
      actions: [
        submit,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  createNewWorkspace(BuildContext ctx) {
    var newWS;
    // ignore: deprecated_member_use
    Widget submit = FlatButton(
      child: Text(
        "Submit",
      ),
      onPressed: () async {
        newWS = _newWSpaceController.text;
        Map<String, dynamic> wsNew = {
          "name": newWS,
        };
        print(wsNew);
        await _wsbloc.createWorkspace(wsNew).then((value) {
          print('_=_=_=_');
          print(value.message);
          final snackBar = SnackBar(
            content: Text('${value.message}'),
            backgroundColor: Colors.red,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            behavior: SnackBarBehavior.floating,
            width: 300,
          );
          if (value.code == 711) {
            wsdto = new DtoWS();
            wsdto.workspaceId = value.id;
            wsdto.workspacename = value.name;
            widget.data.workspaces.add(wsdto);
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          Navigator.pop(context);
        });
      },
    );
    AlertDialog alert;

    alert = AlertDialog(
      title: Text("New Workspace"),
      content: TextField(
        controller: _newWSpaceController,
      ),
      actions: [
        submit,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future _asyncConfirmDialog(
      {BuildContext context, DeleteAction action, reqdata}) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion:'),
          content: const Text('Are you sure you want to delete this?'),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: const Text('Cancel'),
              onPressed: () {
                // Navigator.of(context).pop(ConfirmAction.Cancel);
              },
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: const Text('Delete'),
              onPressed: () async {
                //TODO continue
                if (action == DeleteAction.Space) {
                  await _spacebloc.deleteSpace(reqdata).then((value) {
                    print(value);
                  });
                } else if (action == DeleteAction.Workspace) {
                  await _wsbloc.deleteWS(reqdata).then((value) {
                    print(value);
                  });
                }
                Navigator.pop(context);
                // Navigator.of(context).pop(ConfirmAction.Accept);
              },
            )
          ],
        );
      },
    );
  }
}

enum DeleteAction { Workspace, Space, List, Task }
