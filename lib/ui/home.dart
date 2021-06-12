import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:slark/ui/space.dart';
import 'package:slark/ui/user_tasks.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<String> workspaces = ['work1', 'work2', 'work3'];
  List<String> spaces = ['space1', 'space2', 'space3', 'space4', 'vvv'];

  String selectedWorkspace;

  final List<Widget> _widgetOptions = [
    SpaceScreen(),
    UserTasksScreen(),
  ];

  // ignore: must_call_super
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
                  showModal(toView: workspaces);
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
                onPressed: () async {
                  showModal(toView: spaces);
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
              onPressed: () {
                showModal(text: "Hello");
              },
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

  contentList(List myList) {
    // Widget listt;
    List<Widget> buttons = [];
    for (var item in myList) {
      buttons.add(
        SizedBox(
          child: Column(
            children: [
              // ignore: deprecated_member_use
              FlatButton(
                onPressed: () {},
                child: Text(
                  '$item',
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'AdventPro',
                    fontSize: 18.0,
                  ),
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              Divider(
                height: 8.0,
                color: Colors.grey,
                thickness: 0.5,
                endIndent: 1.0,
                indent: 1.0,
              )
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.only(
          top: 10.0, left: 120.0, bottom: 10.0, right: 120.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: buttons,
      ),
    );
  }

  showModal({String text, List toView}) {
    return showModalBottomSheet(
      context: context,
      barrierColor: Colors.black38,
      backgroundColor: Colors.white,
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      builder: (BuildContext context) {
        bool hasText = (text == null) ? false : true;
        const double height = 400;
        return Container(
          height: height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Visibility(
                  visible: hasText,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 15.0,
                      ),
                      Container(
                        padding: const EdgeInsets.only(
                            left: 120.0, top: 10.0, bottom: 10.0, right: 120.0),
                        // color: Colors.black45,
                        child: Text(
                          '$text',
                          style: TextStyle(
                            color: Color(0xff7b68ee),
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                ListView(
                  children: [contentList(toView)],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
