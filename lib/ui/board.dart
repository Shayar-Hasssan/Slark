import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:collection/collection.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  //TODO function to group it by priority//by date//and sort them correctly
  List<Map<String, dynamic>> tasks = [
    {'task': 'task4', 'status': 'Todo'},
    {'task': 'task7', 'status': 'Planning'},
    {'task': 'task3', 'status': 'Completed'},
    {'task': 'task 2', 'status': 'Testing'},
    {'task': 'task6', 'status': 'Todo'},
    {'task': 'task1', 'status': 'Testing'},
    {'task': 'task5', 'status': 'Todo'},
  ];
  @override
  void initState() {
    groupByStatus(tasks);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SLARK'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.done),
          ),
        ],
        backgroundColor: Color(0xff7b68ee),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 300,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [groupByStatus(tasks)],
              // Container(
              //   width: 200.0,
              //   color: Colors.red,
              // ),
              // SizedBox(width: 10.0),
              // Container(
              //   width: 200.0,
              //   color: Colors.blue,
              // ),
              // SizedBox(width: 10.0),
              // Container(
              //   width: 200.0,
              //   color: Colors.green,
              // ),
              // SizedBox(width: 10.0),
              // Container(
              //   width: 200.0,
              //   color: Colors.yellow,
              // ),
              // SizedBox(width: 10.0),
              // Container(
              //   width: 200.0,
              //   color: Colors.orange,
              // ),
            ),
          ),
        ),
      ),
    );
  }

  groupByStatus(List listOfTasks) {
    List<Widget> myWidget = [];
    var statusGroup = groupBy(listOfTasks, (obj) {
      print(obj['status']);
      return obj['status'];
    });
    print(statusGroup);
    for (var item1 in statusGroup.keys) {
      myWidget.add(
        Column(children: [
          Container(
            color: Colors.blue,
            child: Card(
              color: Colors.indigo[100],
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Center(
                  child: Text('$item1'),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 100.0,
          ),
        ]),
      );

      for (var item2 in statusGroup.values) {
        for (var item in item2) {
          if (item['status'] == item1) {
            myWidget.add(
              Card(
                color: Colors.pink,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(120, 30, 120, 30),
                  child: Text('${item['task']}'),
                ),
              ),
            );
          }
        }
      }
      return Container(
          width: 300,
          height: 250,
          color: Colors.amber,
          child: Column(children: myWidget));
    }
  }
}
