import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TaskInfo extends StatefulWidget {
  @override
  _TaskInfoState createState() => _TaskInfoState();
}

class _TaskInfoState extends State<TaskInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SLARK'),
        backgroundColor: Color(0xff7b68ee),
      ),
      body: SafeArea(child: Text("Task Info")),
    );
  }
}
