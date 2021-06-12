import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

class SpaceScreen extends StatefulWidget {
  @override
  _SpaceScreenState createState() => _SpaceScreenState();
}

class _SpaceScreenState extends State<SpaceScreen> {
  List<Map<String, dynamic>> myList = [
    // {'listName': '', 'taskName': ''}
  ];
  List<Map<String, dynamic>> task = [
    {
      'listName': 'list',
      'taskName': 'mytask',
    },
    {'listName': 'list2', 'taskName': 'taskyy'},
    {'listName': 'list', 'taskName': 'tasky'},
    {'listName': 'list3', 'taskName': 'tttasky'},
    {'listName': 'list3', 'taskName': 'taskkk'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: spaceWidget(task),
    );
  }

  spaceWidget(list) {
    if (list.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Alll your Space lists and tasks are here"),
            SizedBox(
              height: 15.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Add a new task press"),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return ListView(
        children: [
          contentList(list),
        ],
      );
    }
  }

  contentList(List myList) {
    List listsName = [];
    List<Widget> myWidget = [];
    var listGrouping = groupBy(myList, (obj) {
      print(obj['listName']);
      return obj['listName'];
    });
    print(listGrouping);
    for (var item1 in listGrouping.keys) {
      print('Key : $item1');

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
                        '$item1',
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
      print("ListName $listsName");
      for (var item2 in listGrouping.values) {
        for (var item in item2) {
          print("Value: ${item['taskName']}");
          if (item['listName'] == item1) {
            myWidget.add(
              Container(
                color: Colors.indigo[50],
                width: 500.0,
                // ignore: deprecated_member_use
                child: FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "/taskInfo");
                  },
                  child: Text('${item['taskName']}'),
                ),
              ),
            );
          }
        }
      }
    }
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Container(
        height: (MediaQuery.of(context).size.height),
        color: Colors.indigo[50],
        child: Column(
          children: myWidget,
        ),
      ),
    );
  }
}
