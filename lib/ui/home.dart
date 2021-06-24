import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slark/dto/dto_list.dart';
import 'package:slark/dto/dto_space.dart';
import 'package:slark/dto/dto_user.dart';
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
  var udto = new DtoUser();

  String newTask = '';
  String newWSName = '';
  String newSpaceName = '';
  String newList = '';
  List<DtoSpace> spacesmenuItem = [];
  String selectedSpace = 'choose space';
  List<String> tasks = ['task1'];
  List<String> lists = ['list', 'list2', 'list3'];

  String selectedWorkspace;
  bool isWorkspace;
  String selectedList;
  var newspace;
  bool isExpand;
  var selectedWSId;
  var selectedSpaceId;
  List<DtoList> listsItems = [];

  @override
  // ignore: must_call_super
  initState() {
    print('AT HOME SCREEN');

    selectedWorkspace = widget.data.workspaces.first.workspacename;
    selectedWSId = widget.data.workspaces.first.workspaceId;
    // selectedSpace = spacesmenuItem.first.spacename;
    setState(() {
      selectedList = lists.first;
      isWorkspace = false;
      isExpand = false;
    });
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
                    onPressed: () {},
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
                  MaterialPageRoute(builder: (context) => SettingScreen()),
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
                _newTaskDialog(context, lists, _newTaskController);
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

  listsWidget() {
    List<Widget> myWidget = [];
    if (listsItems.length < 0) {
      return Center(
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
                  onPressed: () {
                    // _newTaskDialog(context, listOfLists, controller)
                  },
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      for (var listItem in listsItems) {
        print('000000 ${listItem.name}');
        print('----- ${listItem.id}');
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
                              Navigator.pushNamed(context, "/listInfo");
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
                          // selectedList = listsItems.first.name;
                          // selectedListId = listsItems.first.id;
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
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () async {
                      if (isWorkspace) {
                        _editNameDialog(context, _spaceEditController);
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
                      final ConfirmAction action =
                          await _asyncConfirmDialog(context);
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
    } else {
      buttons.add(
        Container(
            child: ListTile(
          title: Text('Add new space'),
          onTap: () {
            createNewSpace(context);
          },
        )),
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
                      _editNameDialog(context, _workspaceEditController);
                      setState(() {
                        item = newWSName;
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
                    final ConfirmAction action =
                        await _asyncConfirmDialog(context);
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

  _editNameDialog(BuildContext context, controller) async {
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
                onPressed: () {
                  setState(() {
                    if (isWorkspace) {
                      newWSName = controller.text;
                      print('NEW WS NAME IS $newWSName');
                      print("Controller Value is ${controller.text}");
                    } else {
                      newSpaceName = controller.text;
                      print('NEW Space NAME IS $newSpaceName');
                      print("Controller Value is ${controller.text}");
                    }
                  });

                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  _newTaskDialog(
      BuildContext context, List<String> listOfLists, controller) async {
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
              width: 250.0,
              child: Column(
                children: [
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    width: 250.0,
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
                                          value: item, child: Text(item));
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
                            child: Text('Or create new list'),
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
                  // ignore: await_only_futures
                  await setState(() {
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
    // ignore: deprecated_member_use
    Widget submit = FlatButton(
      child: Text(
        "Submit",
      ),
      onPressed: () {
        setState(() {
          newList = _newListController.text;
        });
        lists.add(newList);

        print(lists);
        setState(() {
          selectedList = newList;
        });
        Navigator.pop(context);
        _newTaskDialog(context, lists, _newTaskController);
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
    // ignore: deprecated_member_use
    Widget submit = FlatButton(
      child: Text(
        "Submit",
      ),
      onPressed: () {
        setState(() {
          newspace = _newspaceController.text;
        });
        spacesmenuItem.add(newspace);

        print(spacesmenuItem);
        setState(() {
          selectedSpace = newspace;
        });
        Navigator.pop(context);
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
}

enum ConfirmAction { Cancel, Accept }
Future<ConfirmAction> _asyncConfirmDialog(BuildContext context) async {
  return showDialog<ConfirmAction>(
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
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          // ignore: deprecated_member_use
          FlatButton(
            child: const Text('Delete'),
            onPressed: () {
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          )
        ],
      );
    },
  );
}
