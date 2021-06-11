import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slark/model/user.dart';
import 'package:slark/ui/space.dart';
import 'package:slark/ui/user_tasks.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User user;
  int _selectedIndex = 0;
  List<String> workspaces = ['work1', 'work2', 'work3'];
  String selectedWorkspace;

  final List<Widget> _widgetOptions = [
    SpaceScreen(),
    UserTasksScreen(),
  ];

  @override
  initState() {
    setState(() {
      selectedWorkspace = workspaces.first;
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
                            onPressed: () {},
                            icon: Icon(Icons.person_rounded),
                            iconSize: 70.0,
                            color: Colors.white,
                          ),
                          Text(
                            'Shayar',
                            // '${user.getUsername()}',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: 'AdventPro'),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'shero.16@gmail.com',
                            // '${user.email}',
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
            ListTile(
              // ignore: deprecated_member_use
              title: FlatButton(
                onPressed: () async {
                  final String workspaceName = '';
                  showModalBottomSheet(
                    context: context,
                    barrierColor: Colors.white38,
                    backgroundColor: Color(0xff7b68ee),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    builder: (BuildContext context) {
                      return Container(
                        height: 300,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                'Your Workspaces:',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20.0),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              ///////////////
                              Container(
                                child: Card(
                                  child: workspaceList(),
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.group_outlined),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('Workspaces'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              // ignore: deprecated_member_use
              title: FlatButton(
                onPressed: () {
                  //return showModalBottomSheet(context: context, builder: Text('Hellos'),),
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.workspaces_filled),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('Spaces'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ListTile(
              // ignore: deprecated_member_use
              title: FlatButton(
                onPressed: () {
                  //return showModalBottomSheet(context: context, builder: Text('Hellos'),),
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.favorite),
                    SizedBox(
                      width: 15.0,
                    ),
                    Text('Favorites'),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
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
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 16.0,
        selectedItemColor: Color(0xff7b68ee),
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

  workspaceList() {
    // Widget listt;
    List<Widget> buttons = [];
    for (var item in workspaces) {
      buttons.add(
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {},
          child: Text(
            '$item',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'AdventPro',
              fontSize: 25.0,
            ),
          ),
        ),
      );
    }
    return Column(
      children: buttons,
    );
  }
}
