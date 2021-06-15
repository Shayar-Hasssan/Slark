import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slark/ui/space.dart';
import 'package:slark/ui/user_tasks.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _workspaceEditController = TextEditingController();
  TextEditingController _spaceEditController = TextEditingController();
  TextEditingController _newTaskController = TextEditingController();
  int _selectedIndex = 0;
  String newTask = '';
  String newWSName = '';
  String newSpaceName = '';
  String selectedSpace = '';

  List<String> workspaces = [
    'work1',
    'work2',
    'work3',
    'work3',
    'work3',
    'work3',
    'work3',
  ];

  List<String> spaces = [
    'space1',
    'space2',
    'space3',
    'space4',
    'vvv',
    'gggg',
    'jcds',
    'jnjdkncj'
  ];
  List<String> tasks = ['task1'];
  List<String> lists = ['list', 'list2', 'list3'];
  bool isWorkspace;
  String selectedList;

  String selectedWorkspace;
  bool isExpand;

  final List<Widget> _widgetOptions = [
    SpaceScreen(),
    UserTasksScreen(),
  ];

  // ignore: must_call_super
  initState() {
    setState(() {
      selectedWorkspace = workspaces.first;
      selectedList = lists.first;
      selectedSpace = spaces.first;
      isWorkspace = false;
      isExpand = false;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
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
                              Navigator.pushNamed(context, '/profile');
                            },
                            icon: Icon(Icons.person_rounded),
                            iconSize: 70.0,
                            color: Colors.white,
                          ),
                          Text(
                            'Shayar',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'AdventPro'),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'User Role',
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
                          print('HIIIIII');
                          setState(() {
                            isExpand = !isExpanded;
                          });
                          print(isExpand);
                        },
                        onLongPress: () {
                          print("HELLLLOOOOOOOO");
                        });
                  },
                  body: Container(
                    height: 200.0,
                    child: contentList(spaces, isWorkspace),
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

                showModal(workspaces);
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
            // ListTile(
            //   title: Text(
            //     'Favorite',
            //     style: TextStyle(fontSize: 16.0),
            //   ),
            //   leading: Icon(
            //     Icons.favorite,
            //     color: Colors.black,
            //     size: 20.0,
            //   ),
            //   onTap: () {},
            // ),
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
                Navigator.pushNamed(context, '/setting');
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
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 16.0,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.workspaces_outline),
            label: 'Space',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.toll_rounded),
            label: 'Tasks',
          ),
        ],
      ),
    );
  }

  contentList(List myList, bool isWorkspace) {
    // Widget listt;
    List<Widget> buttons = [];
    for (var item in myList) {
      buttons.add(
        Container(
          child: ListTile(
            onTap: () {
              if (isWorkspace) {
                setWorkspace(item);
              } else
                spaceNavigate(item);
            },
            leading: Text(
              '$item',
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
                    } else
                      _editNameDialog(context, _spaceEditController);
                    setState(() {
                      item = newSpaceName;
                    });
                  },
                  icon: Icon(
                    Icons.edit,
                    color: Colors.indigo,
                    size: 18.0,
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    final ConfirmAction action =
                        await _asyncConfirmDialog(context);
                    print(action);
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

  spaceNavigate(name) {
    setState(() {
      selectedSpace = name;
      print(selectedSpace);
    });
    Navigator.pushNamed(context, '/home');
  }

  setWorkspace(name) {
    setState(() {
      selectedWorkspace = name;
      print(selectedWorkspace);
    });
  }

  showModal(List toView) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.black38,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      builder: (BuildContext context) {
        bool hasList = (toView == null) ? false : true;
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
              Visibility(
                visible: hasList,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Container(
                    height: 350.0,
                    color: Colors.indigo[50],
                    child: contentList(toView, isWorkspace),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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
              'New Task Name',
              style: TextStyle(color: Colors.indigo, fontSize: 24.0),
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
                    width: 100.0,
                    color: Colors.indigo[50],
                    child: Center(
                      child: DropdownButton(
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
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
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
