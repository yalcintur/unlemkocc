import 'package:flutter/material.dart';
import 'package:connectivity/connectivity.dart';
import '../Pages/splash.dart';
import '../Components/progressIndicator.dart';


class NoConnection extends StatefulWidget {
  @override
  _NoConnectionState createState() => _NoConnectionState();
}

class _NoConnectionState extends State<NoConnection> {

  var result;
  var subscription;

  bool boolit(ConnectivityResult result){
    if(result == ConnectivityResult.none){
      return false;
    }else return true;


  }

  @override
  initState() {
    super.initState();

    subscription = Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      // Got a new connectivity status!
      setState(() {
        result = result;
      });
    });
  }

// Be sure to cancel subscription after you are done
  @override
  dispose() {
    super.dispose();

    subscription.cancel();
  }



  @override
  Widget build(BuildContext context) {
    var Stackstyle = new TextStyle(fontFamily: "DINCondensed-Bold",color: Color.fromRGBO(164,164,164,1),fontSize: 18,fontWeight: FontWeight.w500);
    return boolit(result) ?

     MaterialApp(
      home: new Scaffold(
          body: new Container(
            color: Colors.white,
            child:new Center(child: new Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[

              new Container(
                width: MediaQuery.of(context).size.width/2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AspectRatio(
                      aspectRatio: 204/208,
                      child: Image.asset("assets/noConnection.png"),
                    ),


                  ],
                ),
              ),
              new Container(height: 25,),
              new Container(width:MediaQuery.of(context).size.width/2+40 ,child: new Text("BAĞLANTI YOK",style: TextStyle(fontFamily: "Futura-CondensedMedium",fontSize: 35),)),
              new Container(height: 25,),
              new Container( width:MediaQuery.of(context).size.width/2, child:  Column(children: <Widget>[
                new Column(children: <Widget>[
                  new Text("Wifi’nin fişi çekilmiş olabilir.",style: Stackstyle,textAlign: TextAlign.center,),
                  Container(height: 5,),
                  new Text(" İnternet paketin bitmiş olabilir.",style: Stackstyle,textAlign: TextAlign.center),
                  Container(height: 5,),
                  new Text(" Ama merak etme uygulama çökmemiştir, çökse duramazsın.",style: Stackstyle,textAlign: TextAlign.center),


                ],)
              ],
              ))


            ],)




            ),
          )),
    )

        : Splash();
  }
}
