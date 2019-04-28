import 'package:flutter/material.dart';
import '../Pages/splash.dart';
import 'package:connectivity/connectivity.dart';
import '../Components/progressIndicator.dart';
import './noConnection.dart';
import 'dart:async';
import './Login.dart';

class Connector extends StatefulWidget {
  _ConnectorState createState() => _ConnectorState();

}



class _ConnectorState extends State<Connector> {

  bool checked = false;
  bool result;
  Future<void> checkConnection() async{

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||connectivityResult == ConnectivityResult.wifi) {
      print(connectivityResult);
      setState(() {
        result= true;
        checked = true;

      });
      // I am connected to a mobile network.
    } else {if(connectivityResult == ConnectivityResult.none){
      setState(() {
        result= false;
        checked = true;

      });}
    }

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConnection();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: checked ?



          result? Splash(): NoConnection()


          : new Container(
        color: Colors.white,
        child: Center(
          child: new Text("sasdas"),
        ),

      ) ,
    );
  }
}