import 'package:flutter/material.dart';
import './Pages/loginPage.dart';
import './Components/bottomtab.dart';


void main() => runApp(App());


 class App extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    Bottomtab.tag: (context) => Bottomtab(),
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