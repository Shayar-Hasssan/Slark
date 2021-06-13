import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height - 300,
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0, right: 8.0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  width: 200.0,
                  color: Colors.red,
                ),
                SizedBox(width: 10.0),
                Container(
                  width: 200.0,
                  color: Colors.blue,
                ),
                SizedBox(width: 10.0),
                Container(
                  width: 200.0,
                  color: Colors.green,
                ),
                SizedBox(width: 10.0),
                Container(
                  width: 200.0,
                  color: Colors.yellow,
                ),
                SizedBox(width: 10.0),
                Container(
                  width: 200.0,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
