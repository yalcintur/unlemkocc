import 'package:flutter/material.dart';
import '../Model/kose.dart';
import '../Algorithms/dergimap.dart';
import '../Theme.dart' as Theme;

class KoseDetail extends StatelessWidget {
  Kose content;
  int index;
  KoseDetail({this.content = null,this.index});

  Dimension calculatedimens(double width) {
    double height = ((width * 230) ~/ 375).toDouble();
    return Dimension(width, height);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Container(
          child: new SingleChildScrollView(

              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

          new Hero(tag: "$index kose",

          child: new Container(//Head Image
            width: MediaQuery.of(context).size.width,
            height: calculatedimens(MediaQuery.of(context).size.width).height,
            decoration: BoxDecoration(
              image: new DecorationImage(
                  image: NetworkImage(content.link.toString()), fit: BoxFit.fill),
              boxShadow: [
                new BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  offset: new Offset(0.0, 1.0),
                )
              ],
            ),
          )), //image
          //TODO:Author
          new Container(
            //alignment: Alignment(0, -1),
              margin: EdgeInsets.only(left: 10.0,top:12.0 ),
              child: new Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
          new Text(content.author.toString(), style: TextStyle(color: Colors.black,fontFamily: "Impact",fontSize: 16.0)),
          
          new Container(height: 5.0,),
          //TODO:Title
          new Text(content.title.toString(),style: TextStyle(color: Colors.black,fontFamily: "Impact",fontSize: 30.0)),
          new Container(height: 15,),
          //content
          //TODO:Content
          new Text(content.icerik.toString(),style: TextStyle(color: Colors.black,fontFamily: "SourceSansPro-Semibold",fontSize: 15.0)),
                    new Container(height: 10.0,)
          ])),



        ],



      ))),
    );
  }
}
