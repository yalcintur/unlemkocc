import 'package:flutter/material.dart';
import '../Components/kosetile.dart';
import '../Model/kose.dart';
 import '../Theme.dart' as Theme;
 import '../Algorithms/dergimap.dart';
 import 'dart:async';

class Koseler extends StatefulWidget {
  _KoselerState createState() => _KoselerState();
}

class _KoselerState extends State<Koseler> {
  ScrollController _controller = ScrollController();
  ScrollController _listControl = ScrollController();
  var catagoria = "tekno";
  int ElementPosition = 0;
  List<Catog> catoglist = [];
  List<Kose> koselist= [];
  bool loading = true;


    bool ask(int pos){
     // print ("tried");
      if(pos == ElementPosition){
       // print("true");
        return false;
      }else {
        //print("false");
        return true;
      }

    }
   Widget NavTitle(int pos,String tit){
     if( pos== ElementPosition){

       return new Center( child:Text(tit.toString(),style: Theme.TextStyles.navElementTitleHighLit));
     }else return  new Center( child:Text(tit.toString(),style: Theme.TextStyles.navElementTitle));
   }
   Widget NavElement(String title,String route,int position){
     double itemSize = title.toString().length*12.0;
    return new Container(
      height: 40.0,
      width: itemSize,
      child: new GestureDetector(
        onTap: (){
          var durationnn = (KoselerAlgorithm.calculateposition(itemSize,_controller.offset, position,)-_controller.offset).abs().toInt()/1.5;
          try{
            _controller.animateTo(KoselerAlgorithm.calculateposition(itemSize,_controller.offset, position,),curve: Curves.linear,duration: Duration(milliseconds: durationnn.toInt()));
            _pageController.animateToPage(position, duration: Duration(milliseconds: durationnn.toInt()),curve: Curves.linear);
          }catch(e){
            _pageController.animateToPage(position, duration: Duration(milliseconds: 200),curve: Curves.linear);
          }

        print("asd");
          setState(() {
            catagoria = route; //Hangi Sayfa Renderlanıcak
            ElementPosition = position;
          });

        },
        //child: new Center(
        //    child: Text(title.toUpperCase(),style: Theme.TextStyles.navElementTitle,)
          child: ask(position) ? new SizedBox(width: itemSize,height: 40.0,child: new Center(child: new FittedBox(child: Text(title.toString().toUpperCase(),style: Theme.TextStyles.navElementTitle,)))) : new SizedBox(width: itemSize-20,height: 40.0,child: Center(child: new FittedBox(child: Text(title.toString().toUpperCase(),style: Theme.TextStyles.navElementTitleHighLit,))))
        //),
      ),

    );
  }

  Future<List<Catog>> getCatog() async{
    var asdsd = await Catogs.getlist();

    setState(() {
      catoglist = asdsd;

      loading = false;
      });


  }

  PageController _pageController;
    var pre;
    void _listener(){
      var anin= _pageController.page.round();
      double itemSize = catoglist[anin].title.length*12.0;
      if(ElementPosition != anin && anin != pre){
        var durationnn = (KoselerAlgorithm.calculateposition(itemSize,_controller.offset, anin,)-_controller.offset).abs().toInt()/1.5;
          _controller.animateTo(KoselerAlgorithm.calculateposition(itemSize,_controller.offset, anin,),curve: Curves.linear,duration: Duration(milliseconds: durationnn.toInt()));

        setState(() {
          ElementPosition = anin;
        });
      }else pre= anin;
    }

  Widget PageV(){

      return new Expanded(
        child: PageView(
          controller: _pageController,
          children:catoglist.map((list) => Lister(list)).toList() ,
        ),
      );


  }
  Widget Lister(var list){
      return  new Container(child: ListView.builder(
          padding: EdgeInsets.only(top: 0),
    controller: _listControl,
    itemCount: list.koselist.length,
    itemBuilder: (context, position) {
    return new Kosetile( content:  list.koselist[position], index: position,);
    }
    ));
      
  }









@override
  void initState() {
    // TODO: implement initState
  _pageController = new PageController()..addListener(_listener);
  super.initState();
    getCatog();

  }

   List<Kose> getPlanetById(var route) {

     //print("sssssssssssssssssssssssssssssssssssssssssssssssssssss $route");
      //print(catoglist.toList()[0].route);

      if(catoglist != []) {
        var a = catoglist
            .where((p) => p.route == route)
            .first;
        if(a!= null){
        //  print(a.koselist[0].title);
          return a.koselist;

        }else return [];
      }return [];
  }

  @override
  Widget build(BuildContext context) {
    return checkload();

}

Widget checkload(){

    if(loading == false){
      var navBar = new Container(
        margin: EdgeInsets.only(bottom: 8.0),
          color: Colors.black,
          width: MediaQuery.of(context).size.width,
          height: 40.0,
          //alignment: Alignment.center,
          child: //new Center(child:
          ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _controller,
              itemCount: catoglist.length,
              itemBuilder: (context, position) {
                return  NavElement(catoglist[position].title,catoglist[position].route,position);
              }));

      return new Container(
        color: Colors.white70,
        child: new Column(
          children: <Widget>[
            navBar, // Navbar
            PageV(),
          ],
        ),
      );
    }else return Container(child : Text("loading"));
    }

    }


