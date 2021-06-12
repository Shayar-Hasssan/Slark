import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class UserTasksScreen extends StatefulWidget {
  @override
  _UserTasksScreenState createState() => _UserTasksScreenState();
}

class _UserTasksScreenState extends State<UserTasksScreen> {
  List<String> userTasks = [
    "Task1",
    "Task2",
    "Task3",
    "Task4",
    "Task5",
    "Task6",
    "Task7",
    "Task8",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          child: userTasksWidget(userTasks),
          color: Colors.indigo[50],
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
        ),
      ),
    );
  }

  userTasksWidget(List list) {
    List<Widget> tasks = [];
    if (list.isEmpty) {
      return Center(
        child: Text('Tasks assigned to you!'),
      );
    } else {
      for (var item in list) {
        tasks.add(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 30.0,
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$item',
                        style: TextStyle(fontSize: 20.0),
                      ),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                'List Name',
                                style: TextStyle(fontSize: 12.0),
                              ),
                              Text(
                                'Space Name',
                                style: TextStyle(fontSize: 12.0),
                              ),
                            ],
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/taskInfo');
                            },
                            icon: Icon(Icons.info_outline),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Divider(
                height: 5.0,
                color: Colors.grey,
                thickness: 0.4,
                endIndent: 50.0,
                indent: 50.0,
              ),
              SizedBox(
                height: 15.0,
              ),
            ],
          ),
        );
      }
      return Padding(
        padding: const EdgeInsets.all(13.0),
        child: ListView(
          children: tasks,
        ),
      );
    }
  }
}
