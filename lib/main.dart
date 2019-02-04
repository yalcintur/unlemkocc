import 'package:flutter/material.dart';
import './Pages/loginPage.dart';
import './Components/bottomtab.dart';
import './Pages/dergidetailPage.dart';


void main() => runApp(App());


 class App extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    Bottomtab.tag: (context) => Bottomtab(),
    //DergiDetail.tag: (context) => DergiDetail(),
  };


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
      routes: routes,
    );
  }
}