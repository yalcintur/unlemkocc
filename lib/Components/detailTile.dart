import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;

class DetailTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: new BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(5.0),
      ),

      width: 304.0,
      height: 41.0,


      child: new Row(
        children: <Widget>[
          new Text("Ekim Sayısı 2018"),
        ],
      ),
    );
  }
}
