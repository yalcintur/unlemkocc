import 'package:flutter/material.dart';
import 'dart:async';
import 'package:aurorav10/Components/bottomtab.dart';
import 'package:aurorav10/Components/progressIndicator.dart';
import '../Model/timers.dart';
import '../Model/carousel.dart';
import '../Model/dergis.dart';
import '../Model/kose.dart';
import '../Model/videos.dart';
import '../Model/timers.dart';






class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}


class _SplashState extends State<Splash> {
  bool loaded = false;
  int readyC= 0;

  Future<List<Timerrr>> getTimer() async{
    print("started");
    var amk = await Timers.Timerrrcallback();
    print("finished");
    setState(() {
      readyC++;
    });
    IsLoaded();
  }
  Future<List<Carousell>> getCaro() async {
    print("started");
    var amk = await Carousells.Carousellcallback();
    print("finished");
    setState(() {
      readyC++;
    });
    IsLoaded();
  }
  Future getVideolist() async {
    print("started");
    var val = await VideoDao.dergicallback();
    var wexpval = await WillExpire.dergicallback();
    print("finished");
    setState(() {
      readyC++;
    });
    IsLoaded();
  }
  Future<List<Catog>> getCatog() async{
    print("started");
    var asdsd = await Catogs.getlist();
    print("finished");
    setState(() {
      readyC++;
    });
    IsLoaded();}

  Future getlist() async {
    print("started");
    var val = await DergiDao.dergicallback();
    print("finished");
    setState(() {
      readyC++;
    });
    IsLoaded();
  }





  void IsLoaded(){
    if(readyC == 5){
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return Bottomtab();
    }));}

  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTimer();
    getCatog();
    getlist();
    getCaro();
    getVideolist();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
        color: Colors.white,
        child: Center(
          child: PrgsIndicator(),
        ),
      ),
    );
  }
}
