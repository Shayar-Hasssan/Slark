import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class SpaceScreen extends StatefulWidget {
  @override
  _SpaceScreenState createState() => _SpaceScreenState();
}

class _SpaceScreenState extends State<SpaceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("your Space lists and tasks are here"),
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
      ),
    );
  }
}
