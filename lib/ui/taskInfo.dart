import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slark/bloc/task_bloc.dart';

class TaskInfo extends StatefulWidget {
  @override
  _TaskInfoState createState() => _TaskInfoState();
  final data;
  final listname;
  TaskInfo({Key key, this.data, this.listname}) : super(key: key);
}

class _TaskInfoState extends State<TaskInfo> {
  var color;
  String taskLink = 'https://pub.dev/';
  bool _isEditingText = false;
  TextEditingController _taskController;
  // TextEditingController _descrptionController;
  String initialTask;
  List comments = ['This is your description'];
  bool taskStatus = false; //Not Completed task yet
  final _taskbloc = new TaskBloc();
  @override
  void initState() {
    super.initState();
    initialTask = "${widget.data.name}";
    _taskController = TextEditingController(text: initialTask);
    // _descrptionController = TextEditingController(text: comments);
    statusColor();
    print('Task status is : $taskStatus');
  }

  @override
  void dispose() {
    _taskController.dispose();
    // _descrptionController.dispose();
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
                          subtitle: Text('${widget.listname}'))),
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
                          var taskid = widget.data.id;
                          print(taskid);
                          final ConfirmAction action =
                              await _asyncConfirmDialog(context, taskid);
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
                height: MediaQuery.of(context).size.height,
                width: 450.0,
                // color: Colors.amber,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                          child: Container(
                        width: 550,
                        height: 220,
                        padding: new EdgeInsets.all(10.0),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          color: Colors.indigo[300],
                          elevation: 10,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                title: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Status",
                                      style: TextStyle(
                                        letterSpacing: 2.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                // ignore: deprecated_member_use
                                subtitle: RaisedButton.icon(
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
                              ),
                              Divider(
                                indent: 100.0,
                                endIndent: 100.0,
                                color: Colors.indigo[100],
                                thickness: 1.0,
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
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                      SizedBox(height: 25.0),
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
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Subtasks",
                            style: TextStyle(
                                fontSize: 20.0,
                                color: Colors.indigo,
                                fontWeight: FontWeight.bold),
                          ),
                          // SizedBox(
                          //   width: 8.0,
                          // ),
                          IconButton(
                            //Add Subtask
                            onPressed: () {
                              //update task
                            },
                            icon: Icon(Icons.add),
                            color: Colors.indigo,
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        // child: Row(
                        //   children: [showAssignees()],
                        // ),
                        height: 85,
                        color: Colors.indigo[50],
                      ),
                      SizedBox(
                        height: 20.0,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // ignore: deprecated_member_use
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Color(0xff7b68ee),
                            onPressed: () {},
                            hoverColor: Colors.indigo,
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                'Comments',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ),
                          ),
                          // ignore: deprecated_member_use
                          FlatButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: Color(0xff7b68ee),
                            onPressed: () {},
                            hoverColor: Colors.indigo,
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                'Assigness',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ),
                          ),
                        ],
                      ),

                      // SizedBox(height: 20.0),
                      // Container(
                      //   width: 600,
                      //   height: MediaQuery.of(context).size.height * 0.21,
                      //   color: Colors.indigo[50],
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(13.0),
                      //     child: Column(
                      //       children: [
                      //         //  comment.length>0?:
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
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

  Widget showAssignees() {
    List<Widget> aList = [];
    // ignore: unused_local_variable
    for (var item in widget.data.assignedUsers) {
      aList.add(
        ListView(
          scrollDirection: Axis.horizontal,
          children: [
            CircleAvatar(
              child: Icon(Icons.person),
            ),
            Text('$item'),
          ],
        ),
      );
    }
    return Column(
      children: aList,
    );
  }

  Future<ConfirmAction> _asyncConfirmDialog(
      BuildContext context, taskid) async {
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
              onPressed: () async {
                //TODO continue
                print(taskid);
                await _taskbloc.deleteTask(taskid).then((value) {
                  print('task ${value.name} deleted');
                  print('task ${widget.data.name} deleted');
                });
                Navigator.of(context).pop();
              },
            )
          ],
        );
      },
    );
  }
}

enum ConfirmAction { Cancel, Accept }
