import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import 'package:carousel_pro/carousel_pro.dart';
import '../Model/carousel.dart';




class Home extends StatefulWidget{
  static String tag = 'homcuk-page';
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomeState();
  }

}

class HomeState extends State<Home> {

  bool loaded= false;

  Future<List<Carousell>> getTimer() async{
    var amk = await Carousells.Carousellcallback();
    setState(() {
      loaded = true;
      resimler = amk;
    });
  }

  List<Carousell> resimler;


    Widget CaroU(){
      return new Expanded(
        child: new Carousel(
          images: resimler.map((i) => NetworkImage(i.link)).toList(),
          autoplayDuration: Duration(seconds: 15),
          dotSize: 6.0,
          // dotSpacing: 15.0,
          //dotColor: Colors.lightGreenAccent,
          indicatorBgPadding: 5.0,
          dotBgColor: Colors.black.withOpacity(0.5),
          // borderRadius: true,
        ),

      );
    }


    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTimer();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.Colors.pagebackground,
      //child: new SingleChildScrollView(
      child: new Column(
        children: <Widget>[
        //  new Container(height: 30.0,),

//            child: new SizedBox(
//              height: MediaQuery.of(context).size.height-65-MediaQuery.of(context).padding.top,//HomeAlgorithm.Crousel(context).height.toDouble(),
//              width: MediaQuery.of(context).size.width,//HomeAlgorithm.Crousel(context).width.toDouble(),
          loaded ?

          CaroU()
              : Container(child: new Text("loading"),)
        ],
      ),

    );
  }
}
