import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskInfo extends StatefulWidget {
  @override
  _TaskInfoState createState() => _TaskInfoState();
  final data;
  TaskInfo({Key key, this.data}) : super(key: key);
}

class _TaskInfoState extends State<TaskInfo> {
  var color;
  String taskLink = 'https://pub.dev/';
  bool _isEditingText = false;
  TextEditingController _taskController;
  TextEditingController _descrptionController;
  String initialTask = "Task Name";
  String initialDesc = 'This is your description';
  bool taskStatus = false; //Not Completed task yet

  @override
  void initState() {
    super.initState();
    _taskController = TextEditingController(text: initialTask);
    _descrptionController = TextEditingController(text: initialDesc);
    statusColor();
    print('Task status is : $taskStatus');
  }

  @override
  void dispose() {
    _taskController.dispose();
    _descrptionController.dispose();
    super.dispose();
  }

  statusColor() {
    if (taskStatus == true)
      setState(() {
        color = Colors.green;
      });
    else
      setState(() {
        color = Colors.red;
      });
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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        height: 60.0,
                        width: MediaQuery.of(context).size.width - 200,
                        child: ListTile(
                            title: _editTitleTextField(),
                            subtitle: Text('ListName'))),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            FlutterClipboard.copy('$taskLink')
                                .then((value) => print('$taskLink'));
                          },
                          icon: Icon(
                            Icons.share,
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
                                        setState(() {
                                          taskStatus = !taskStatus;
                                          statusColor();
                                        });
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
                        SizedBox(height: 20.0),
                        Container(
                          width: 500,
                          height: 200,
                          color: Colors.indigo[50],
                          child: Padding(
                            padding: const EdgeInsets.all(13.0),
                            child: TextFormField(
                              controller: _descrptionController,
                              onChanged: (val) {
                                setState(() {
                                  initialDesc = val;
                                });
                              },
                              maxLines: 4,
                              decoration: InputDecoration(
                                hintText: '$initialDesc',
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xff7b68ee),
                                  ),
                                ),
                              ),
                            ),
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

  _editTitleTextField() {
    if (_isEditingText)
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              initialTask = newValue;
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: _taskController,
        ),
      );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Text(
        initialTask,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.grey[600],
          fontWeight: FontWeight.bold,
        ),
      ),
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
        title: Text('Delete This List?'),
        content: const Text(
            'This will delete your list and its task from the workspace, confirm deletion?.'),
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
