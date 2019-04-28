import 'package:flutter/material.dart';
import './Pages/home.dart';
import './Components/bottomtab.dart';
import './Pages/connector.dart';


void main() => runApp(App());


 class App extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    Bottomtab.tag: (context) => Bottomtab(),
    Home.tag: (context) => Home(),
    //DergiDetail.tag: (context) => DergiDetail(),
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Connector(),
      routes: routes,
    );
  }
}