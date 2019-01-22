import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;

class VideoTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: <Widget>[
          new Container(width:140.0 ,height: 76.0, color: Colors.grey,),
          new Container(
            margin: EdgeInsets.only(left: 10.0,right: 10.0),
            width: 168.0,
            child: new Text("data"),
          ),
        ],
      ),
    );
  }
}