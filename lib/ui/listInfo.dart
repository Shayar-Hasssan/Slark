import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListInfo extends StatefulWidget {
  @override
  _ListInfoState createState() => _ListInfoState();
}

class _ListInfoState extends State<ListInfo> {
  List tasks = [
    'task1',
    'task2',
    'task3',
    'task4',
    'task5',
    'task6',
    'task7',
    'task8',
    'task9',
    'task10'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SLARK'),
        backgroundColor: Color(0xff7b68ee),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 20.0, left: 15.0, right: 10.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "List name",
                            style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.more_horiz),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: Colors.indigo,
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // ignore: deprecated_member_use
                      RaisedButton.icon(
                        onPressed: () {},
                        icon: Icon(
                          Icons.calendar_today,
                          color: Colors.indigo,
                        ),
                        label: Text(
                          "Set due date",
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Container(
                      height: 100.0,
                      child: TextFormField(
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Add Description',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xff7b68ee),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    children: [
                      Text(
                        "Assignees",
                        style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.indigo,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8.0,
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.person_add_alt),
                        color: Colors.indigo,
                      ),
                    ],
                  ),
                  Container(
                    height: 100.0,
                    color: Colors.indigo[50],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Tasks in this List',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.add,
                              color: Colors.indigo,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.indigo,
                              )),
                        ],
                      )
                    ],
                  ),
                  Container(
                    color: Colors.indigo[50],
                    height: 110,
                    child: ListView(
                        // children:
                        //  [tasksList(tasks)],
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // tasksList(List list) {
  //   List<Widget> mytasks = [];
  //   for (var item in list) {
  //     mytasks.add(
  //       TextButton(
  //           onPressed: () {},
  //           child: Text(
  //             '$item',
  //             style: TextStyle(color: Colors.black, fontSize: 16.0),
  //           )),
  //     );
  //   }
  //   return Column(children: tasks);
  // }
}
