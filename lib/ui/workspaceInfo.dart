import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WorkspaceInfo extends StatefulWidget {
  @override
  _WorkspaceInfoState createState() => _WorkspaceInfoState();
}

class _WorkspaceInfoState extends State<WorkspaceInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SLARK'),
        backgroundColor: Color(0xff7b68ee),
      ),
    );
  }
}
