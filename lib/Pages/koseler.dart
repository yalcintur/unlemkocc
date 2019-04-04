import 'package:flutter/material.dart';
import '../Components/kosetile.dart';
import '../Model/kose.dart';
 import '../Theme.dart' as Theme;
 import '../Algorithms/dergimap.dart';

class Koseler extends StatefulWidget {
  _KoselerState createState() => _KoselerState();
}

class _KoselerState extends State<Koseler> {
  ScrollController _controller = ScrollController();
  var catagoria = "trend";
  int ElementPosition = 0;
  List<Catog> catoglist = Catogs.getlist();
    bool ask(int pos){
      print ("tried");
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
     double itemSize = 95.0;
    return new Container(
      height: 40.0,
      width: itemSize,
      child: new GestureDetector(
        onTap: (){
          var durationnn = KoselerAlgorithm.calculateposition(itemSize,_controller.offset, position,).abs().toInt()/2;
          _controller.animateTo(KoselerAlgorithm.calculateposition(itemSize,_controller.offset, position,),curve: Curves.linear,duration: Duration(milliseconds: durationnn.toInt()));
          setState(() {
            catagoria = route; //Hangi Sayfa Renderlanıcak
            ElementPosition = position;
          });

        },
        //child: new Center(
        //    child: Text(title.toUpperCase(),style: Theme.TextStyles.navElementTitle,)
          child: ask(position) ? new Center(child:Text(title.toUpperCase(),style: Theme.TextStyles.navElementTitle,)) : Center(child: Text(title.toUpperCase(),style: Theme.TextStyles.navElementTitleHighLit,))
        //),
      ),

    );
  }





  @override
  Widget build(BuildContext context) {

    var navBar = new Container(
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
      color: Theme.Colors.pagebackground,
      child: new Column(
        children: <Widget>[
          navBar, // Navbar

        ],
      ),
    );
  }
}

