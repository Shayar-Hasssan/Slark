import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:slark/bloc/list_bloc.dart';
import 'package:slark/dto/dto_task.dart';
import 'package:slark/ui/taskInfo.dart';
// import 'package:slark/dto/dto_task.dart';

class ListInfo extends StatefulWidget {
  @override
  _ListInfoState createState() => _ListInfoState();
  final data;
  ListInfo({Key key, this.data}) : super(key: key);
}

class _ListInfoState extends State<ListInfo> {
  bool _isEditingText = false;
  final _listbloc = ListBloc();
  TextEditingController _listController;
  TextEditingController _newTaskController = TextEditingController();
  String newTask = '';
  String initialListName;
  String initialDiscription = "Add Description";
  // List<DtoTask> tasks;
  List<DtoTask> tasks = [];
  @override
  void initState() {
    super.initState();
    initialListName = '${widget.data.name}';
    _listController = TextEditingController(text: initialListName);
    setTasks();
  }

  setTasks() {
    for (var item in widget.data.tasks) {
      tasks.add(item);
    }
  }

  @override
  void dispose() {
    _listController.dispose();
    super.dispose();
  }

  DateTime selectedDate = DateTime.now();

  //   'task1',
  //   'task2',
  //   'task3',
  //   'task4',
  //   'task5',
  //   'task6',
  //   'task7',
  //   'task8',
  //   'task9',
  //   'task10'
  // ];
  List<String> assignees = [
    'John',
    'Rebeca',
    'Semi',
    'Danny',
    'Serra',
    'Loriece',
    'Chris'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SLARK'),
        backgroundColor: Color(0xff7b68ee),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.done,
                color: Colors.white,
              ),
            ),
          ),
        ],
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
                          Container(
                            height: 50.0,
                            width: MediaQuery.of(context).size.width - 200,
                            child: _editTitleTextField(
                                initialListName, _listController, 1),
                          ),
                          SizedBox(
                            width: 15.0,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            //delete list
                            onPressed: () async {
                              var deldata = {'id': widget.data.id};
                              print(deldata);
                              await _asyncConfirmDialog(context, deldata);
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
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // ignore: deprecated_member_use
                      RaisedButton.icon(
                        //Set the limit date
                        onPressed: () => _selectDate(context),
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
                  SizedBox(height: 25.0),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'List Tasks',
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(
                            //Add task to list
                            onPressed: () {
                              _newTaskDialog(context, _newTaskController);
                            },
                            icon: Icon(
                              Icons.add,
                              color: Colors.indigo,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Container(
                    color: Colors.indigo[50],
                    height: 200,
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.1,
                      child: ListView(
                        children: [tasksList(tasks)],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  tasksList(List tasklist) {
    List<Widget> mytasks = [];
    for (var titem in tasklist) {
      mytasks.add(
        Column(
          children: [
            ListTile(
              title: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaskInfo(
                              data: titem,
                              listname: widget.data.name,
                            )),
                  );
                },
                child: Text(
                  '${titem.name}',
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.black, fontSize: 16.0),
                ),
              ),
            ),
            Divider(
              thickness: 0.8,
              indent: 90.0,
              endIndent: 90.0,
            ),
          ],
        ),
      );
    }
    return Column(
      children: mytasks,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
    print(selectedDate);
  }

  _editTitleTextField(initialText, controller, maxLine) {
    if (_isEditingText)
      return Center(
        child: TextField(
          maxLines: maxLine,
          onSubmitted: (newValue) {
            setState(() {
              initialText = newValue;
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: controller,
        ),
      );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: Text(
        initialText,
        style: TextStyle(
          fontSize: 25.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _newTaskDialog(BuildContext context, controller) async {
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
                      child: Text('$initialListName'),
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
                  //TODO tasks.add(newTask);
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

  Future _asyncConfirmDialog(BuildContext context, deldata) async {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button for close dialog!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete This List?'),
          content: const Text(
              'This will delete your list and its task from the Space, confirm deletion?.'),
          actions: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              child: const Text('Cancel'),
              onPressed: () {
                print(widget.data.id);
                Navigator.pop(context);
              },
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: const Text('Delete'),
              onPressed: () async {
                //TODO Continue
                await _listbloc.deleteList(deldata).then((value) {
                  // print(value.message);
                  print('List ${widget.data.name} deleted');
                  Navigator.of(context).pop();
                });
                // Navigator.of(context).pop(ConfirmAction.Accept);
              },
            )
          ],
        );
      },
    );
  }
}
