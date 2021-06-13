import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SpaceInfo extends StatefulWidget {
  @override
  _SpaceInfoState createState() => _SpaceInfoState();
}

class _SpaceInfoState extends State<SpaceInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          color: Colors.amber,
          height: 200,
          width: 200,
          child: Column(
            children: [
              Text('You Space Inforamtion'),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close))
            ],
          ),
        ),
      ),
    );
  }
}
