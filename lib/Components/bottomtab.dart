import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import '../Theme.dart' as Theme;
import '../Pages/dergiPage.dart';
import 'dart:math';
import '../Pages/koseler.dart';
import '../Pages/ropor.dart';
import '../Pages/timing.dart';
import '../Pages/home.dart';
import '../Algorithms/dergimap.dart';
import '../Components/ropSayac.dart';

class Bottomtab extends StatefulWidget {
  static String tag = 'home-page';
  var startup;
  Bottomtab({this.startup = 2});
  @override
  _BottomState createState() => _BottomState(startup);
}

class _BottomState extends State<Bottomtab> {
  var startup,currentpage,BarHeight =  40.0;
  _BottomState(this.startup);

 static var startpage=2;
  //Variables
  static var asd= 0,margin,index=2,prev=2,intprev = 2,road=0.0;

static  Color barColor = Colors.black;
  static double heightt = 0,widthh;
  static double barWith = 25;



  //Constants
  final _controller = PageController(
    initialPage: startpage,
    keepPage: true,

  );

  //Functions
  void calculateHeight(){

    setState(() {
      BarHeight = MediaQuery.of(context).size.height/10;
});

  }

  double IsMarginNull(BuildContext context){

    if(margin != null) {
      return margin;
    }else return ((startup*(((MediaQuery.of(context).size.width-40)/5)+8))).toDouble();

  }

  void changed(){ ///Calculate the position of indicator after each change


    var EleWidth = (MediaQuery.of(context).size.width-40)/5;
    if(index!= 0){
      setState(() {
        if(margin != ((index*(EleWidth+8))).toDouble()){
        margin = ((index*(EleWidth+8))).toDouble();}
      });}else{
      setState(() {
        if(margin != ((index * EleWidth)).toDouble()) {
          margin = ((index * EleWidth)).toDouble();
        }});

    }
  }
  void paintBar() {
   var TopBarHeight = 25*MediaQuery.of(context).size.height/360;

    if (currentpage != null) {
      if (currentpage == 2) {
        if (barColor == Colors.black) {

        } else {
          setState(() {
            barWith = 25;
            barColor = Colors.black;
          });
        }
      } else {
        setState(() {
          barWith = BarHeight;
          barColor = Color.fromRGBO(244, 14, 8, 1);
        });
      }
    }else{
      if (startup == 2) {
        if (barColor == Colors.black) {

        } else {
          setState(() {
            barWith = 25;
            barColor = Colors.black;
          });
        }
      } else {
        setState(() {
          barWith = BarHeight;
          barColor = Color.fromRGBO(244, 14, 8, 1);
        });
      }

    }
  }

  void onTap(int a){ ///Animate the Pages after tabs

      setState(() {
        currentpage = a;
        prev = index;
        index = a;
      });
      try{
        if(_controller.hasClients){
        _controller.animateToPage(
            a, duration: Duration(milliseconds: 400), curve: Curves.ease);
        }
      }catch(e){
        print("aha hata işte bottomtab:88 $e");
    }

    }



  //Widgets

  Widget BottomTabBar(){
    BarHeight = MediaQuery.of(context).size.height/15;

    //print(MediaQuery.of(context).size.width);

    var EleWidth = (MediaQuery.of(context).size.width-40)/5;
//    setState(() {
//       BarHeight = (40*MediaQuery.of(context).size.height)/640;
//    });
    //print(EleWidth);
    return new Container(
      color: Colors.black,
      width: MediaQuery.of(context).size.width,
      height: BarHeight,
      child: new Stack( children: <Widget>[
        new Center(child: Container(
          height: BarHeight,
          width:MediaQuery.of(context).size.width-8,
          child: new Row(children :<Widget> [

            new AnimatedContainer(
              margin: EdgeInsets.only(left: IsMarginNull(context)),
              duration: Duration(milliseconds: ((index-prev).abs())*100,),
              height: BarHeight,
              width: EleWidth,
              color: Color.fromRGBO( 209,0,0,1),

            )]),
        )),
        new Row(children: <Widget>[
          new Container(width: 4,),
          new InkWell(
              onTap: (){ onTap(0);},
              child: new SizedBox(
                height: BarHeight,
                width: EleWidth,
                //color: Color.fromRGBO( 209,0,0,1),
                child: new Center(child: Image.asset("assets/BottomBar1.png",height: 25)),
              )),
          new Container(width: 8,),
          new InkWell(
              onTap: (){ onTap(1);},
              child: new SizedBox(
                height: BarHeight,
                //   color: Color.fromRGBO( 209,0,0,1),
                width: EleWidth,
                //  color: DrawBox(1),
                child: new Center(child: Image.asset("assets/BottomBar2.png",height: 25)),
              )),
          new Container(width: 8,),
          new InkWell(
              onTap: (){ onTap(2);},
              child: new SizedBox(
                height: BarHeight,
                width: EleWidth,
                //color: Color.fromRGBO( 209,0,0,1),
                //color: DrawBox(2),
                child: new Center(child: Image.asset("assets/BottomBar3.png",height: 25)),
              )),
          new Container(width: 8,),
          new InkWell(
              onTap: (){ onTap(3);},
              child: new SizedBox(
                // color: Color.fromRGBO(   209,0,0,1),
                height: BarHeight,
                width: EleWidth,
                // color: DrawBox(3),
                child: new Center(child: Image.asset("assets/BottomBar4.png",height: 25)),
              )),
          new Container(width: 8,),
          new InkWell(
              onTap: (){ onTap(4);},
              child:SizedBox(
                height: BarHeight,
                //color: Color.fromRGBO( 209,0,0,1),
                width: EleWidth,
                // color: DrawBox(4),
                child: new Center(child: Image.asset("assets/BottomBar5.png",height: 25)),
              )),
          new Container(width: 4,),


        ])]));
  }






  Widget CustomAppBar(BuildContext context) {

    return new Container(
      width: MediaQuery.of(context).size.width,
      child: new Column(
      children: <Widget>[
        new AnimatedContainer(
          height: MediaQuery.of(context).padding.top,
          color: barColor,
          duration: Duration(milliseconds: 100),
        ),
        new AnimatedContainer(
            height: barWith,
            duration: Duration(milliseconds: 100),
            decoration: BoxDecoration(
                color: barColor,

            ),

      child: new Center(
        child: new Image.asset("assets/unlem@3x.png"),
      )),

  ]));
  }


  void jumpto(){

    if(startup != null && startup != 2){

      _controller.jumpToPage(startup);
    }

  }

  //initstate
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      margin = null;
    });

    SchedulerBinding.instance.addPostFrameCallback((_) => this.jumpto());


  }
  //Build

  @override
  Widget build(BuildContext context) {
    paintBar();
    //Listening Tabbar
    _controller.addListener(changed);

    return new Scaffold(
      body: new Column(
        children: <Widget>[
          new Align(
            alignment: Alignment.topCenter,
            child: CustomAppBar(context),
          ),
          new Expanded(child: PageView(
            controller: _controller,
            physics:new NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              new DergiPage(),
              new Ropo(),
              new Home(),
              new Koseler(),
              new Timing(),
            ],
          )),
          new Align(
            alignment: Alignment.bottomCenter,
            child: BottomTabBar(),
          ),
        ],
      ),
    );
  }

}
