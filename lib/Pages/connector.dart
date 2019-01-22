import 'package:flutter/material.dart';
import '../Components/bottomtab.dart';
class Connector extends StatefulWidget {
  _ConnectorState createState() => _ConnectorState();

}

class _ConnectorState extends State<Connector> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Bottomtab() ,
    );
  }
}