import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskInfo extends StatefulWidget {
  @override
  _TaskInfoState createState() => _TaskInfoState();
}

class _TaskInfoState extends State<TaskInfo> {
  var color = Colors.red;
  // var _icon = Icons.favorite_outline_outlined;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SLARK'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.done),
          ),
        ],
        backgroundColor: Color(0xff7b68ee),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Task Name",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //TODO on pressed copy link to keyboard
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.share,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 800,
                  width: 400.0,
                  // color: Colors.amber,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              color: Colors.indigo[300],
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Status",
                                      style: TextStyle(
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                    // ignore: deprecated_member_use
                                    RaisedButton.icon(
                                      color: Colors.indigo[200],
                                      onPressed: () {
                                        if (color == Colors.red) {
                                          setState(() {
                                            color = Colors.green;
                                          });
                                        } else {
                                          setState(() {
                                            color = Colors.red;
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        Icons.done,
                                        color: color,
                                        size: 25.0,
                                      ),
                                      label: Text(
                                        'Mark as Completed',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: Colors.indigo[300],
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "Created AT:",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 7.0,
                                    ),
                                    Text(
                                      'April, 12 9:00 am',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 2.2),
                                    ),
                                    Divider(
                                      color: Colors.amber,
                                      thickness: 30.0,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 50.0),
                        Container(
                          child: Column(
                            children: [
                              Text(
                                'More Details',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Divider(
                                indent: 90.0,
                                endIndent: 90.0,
                                color: Colors.black,
                                thickness: 0.5,
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Text(
                          'Description:',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18.0),
                        ),
                        // SizedBox(height: 10.0),
                        // Divider(
                        //   thickness: 0.5,
                        //   endIndent: 20.0,
                        //   color: Colors.black87,
                        // ),
                        SizedBox(height: 20.0),
                        Container(
                          width: 500,
                          height: 200,
                          color: Colors.indigo[50],
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: Text('This is your description'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// IconButton(
//   onPressed: () {
//     setState(() {
//       _icon = Icons.favorite;
//     });
//   },
//   icon: Icon(
//     _icon,
//     color: color,
//   ),
// ),
