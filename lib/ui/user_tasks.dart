import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class UserTasksScreen extends StatefulWidget {
  @override
  _UserTasksScreenState createState() => _UserTasksScreenState();
}

class _UserTasksScreenState extends State<UserTasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Tasks assigned to you!'),
      ),
    );
  }
}
