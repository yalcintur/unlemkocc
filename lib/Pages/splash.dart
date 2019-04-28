import 'package:flutter/material.dart';
import 'dart:async';
import 'package:aurorav10/Components/bottomtab.dart';
import 'package:aurorav10/Components/progressIndicator.dart';
import '../Model/timers.dart';
import '../Model/carousel.dart';
import '../Model/dergis.dart';
import '../Model/kose.dart';
import '../Model/videos.dart';
import './Login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/userStats.dart';







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


  isLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print(prefs.getBool("loginStatus")== true);
    if(prefs.getBool("loginStatus")== true){
      UserStatus.setUser(prefs.getString("userEmail"), prefs.getString("userPassword"));
      print(prefs.getBool("loginStatus"));
      getTimer();
      getCatog();
      getlist();
      getCaro();
      getVideolist();
    }else{

      Navigator.push(context, MaterialPageRoute(builder: (_) {
        return Login();
      }));


    }
    print(prefs.getBool("loginStatus"));


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

    isLoggedIn();

  }

  @override
  Widget build(BuildContext context) {
    double logoWidth = MediaQuery.of(context).size.width/2.3;
    double logoHeight = logoWidth;
    return Scaffold(
      body: new Container(
        color: Colors.white,
        child: Center(
          child:  new Stack(
            children: <Widget>[
              Center(
                child: new Container(
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(244,14,8,1

                    ),
                    borderRadius: BorderRadius.circular(logoWidth/2),
                  ),
                  width: logoWidth,
                  height: logoHeight,
                ),
              ),
              Center(
                child: new Image.asset(
                  'assets/logo@3x.png',
                  width: logoWidth,
                  height: logoHeight ,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
