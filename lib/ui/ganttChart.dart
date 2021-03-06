import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GanttChartScreen extends StatefulWidget {
  @override
  _GanttChartScreenState createState() => _GanttChartScreenState();
}

class _GanttChartScreenState extends State<GanttChartScreen> {
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
        child: Text('Ganntt Chart'),
      ),
    );
  }
}
