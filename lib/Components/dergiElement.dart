import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import '../Model/dergi.dart';
import '../Pages/dergidetailPage.dart';
import '../Algorithms/dergimap.dart';
import 'dart:async';
import '../Algorithms/httpPost.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Dergielemet extends StatelessWidget {
  Dergi dergi;
  int indexed;
  Dergielemet(this.dergi, this.indexed);

  Future Likeit(var ids)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var iddergi = dergi.id;
    if(prefs.getBool("$iddergi lk")== null ||prefs.getBool("$iddergi lk")== false ){
      DergiHttp.PutLike(1,ids);

    }

  }
  Future dLikeit(var ids)async{
    var iddergi = dergi.id;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    if(prefs.getBool("$iddergi dlk")== null ||prefs.getBool("$iddergi dlk")== false ){
      DergiHttp.PutDisLike(1,ids);

    }
  }


  @override
  Widget build(BuildContext context) {
    return new Container(
        width: DergiGraph.elementDimens(context)[0],
        height: DergiGraph.elementDimens(context)[1] + 80,
        child: new Stack(
          children: <Widget>[
            new Container(
              margin: EdgeInsets.only(top: 15),
              width: DergiGraph.elementDimens(context)[0],
              height: DergiGraph.elementDimens(context)[1],
              child: new GestureDetector(
                onTap: () {
                  // Navigation
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DergiDetail(dergi.image, dergi.name, indexed,dergi);
                  }));
                },
                child: new Container(
                  // DergiMain
                  width: DergiGraph.elementDimens(context)[0],
                  height: DergiGraph.elementDimens(context)[1],

                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(0, 0, 0, 0.7),
                        blurRadius: 14,
                        offset: Offset(0.0, 0.0)),
                  ]),

                  child: new Stack(
                    children: <Widget>[
                      new Container(
                        color: Color.fromRGBO(209, 0, 0, 1),
                        width: DergiGraph.elementDimens(context)[0],
                        height: DergiGraph.elementDimens(context)[1],
                      ),
                      new Hero(
                        key: Key(indexed.toString() + "asd"),
                        tag: indexed,
                        child: new Container(
                          margin: new EdgeInsets.all(3.0),
                          width: DergiGraph.elementDimens(context)[0] - 6.0,
                          height: DergiGraph.elementDimens(context)[1] - 6.0,
                          decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: NetworkImage(dergi.image),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            //  new Container(height: 25,),
//        new Container(
//
//          child: new Row(
//            children: <Widget>[
            new GestureDetector(
                onTap: () {

                  var ids = dergi.id;

                  print("Liked $ids");

                 Likeit(ids);
                },
                child: new Container(
                  width: (30*DergiGraph.elementDimens(context)[0])/163 ,
                  height: (30*DergiGraph.elementDimens(context)[0])/163,
                  child: new Center(
                    child: new Icon(
                      Icons.thumb_up,
                      size: 16,
                      color: Color.fromRGBO(244, 14, 8, 0.86),
                    ),
                  ),
                  margin: EdgeInsets.only(
                      top: DergiGraph.elementDimens(context)[1] + 12, left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(((30*DergiGraph.elementDimens(context)[0])/163)/2),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Color.fromRGBO(175, 175, 175, 0.6),
                          blurRadius: 7,
                          offset: new Offset(0, 10)),
                    ],
                  ),
                )), //first button
            //center button
            new Align(
                alignment: Alignment.topCenter,
                child: new GestureDetector(
                  onTap: () {
                    // Navigation
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return DergiDetail(dergi.image, dergi.name, indexed,dergi);
                    }));
                  },
                  child: new Container(
                    width: (40*DergiGraph.elementDimens(context)[0])/163,
                    height: (40*DergiGraph.elementDimens(context)[0])/163,
                    child: new Center(
                      child: new Icon(
                        Icons.play_arrow,
                        size: 25,
                        color: Color.fromRGBO(244, 14, 8, 0.86),
                      ),
                    ),
                    margin: EdgeInsets.only(
                        top: DergiGraph.elementDimens(context)[1] - 5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(((40*DergiGraph.elementDimens(context)[0])/163)/2),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(175, 175, 175, 0.6),
                            blurRadius: 7,
                            offset: new Offset(0, 10)),
                      ],
                    ),
                  ),
                )),

            new Align(
                alignment: Alignment.topRight,
                child: new GestureDetector(
                    onTap: () {
                      var ids = dergi.id;
                      print("Disliked $ids");

                      dLikeit(ids);
                    },
                    child: new Container(
                      width: (30*DergiGraph.elementDimens(context)[0])/163,
                      height: (30*DergiGraph.elementDimens(context)[0])/163,
                      child: new Center(
                        child: new Icon(
                          Icons.thumb_down,
                          size: 16,
                          color: Color.fromRGBO(244, 14, 8, 0.86),
                        ),
                      ),
                      margin: EdgeInsets.only(
                          top: DergiGraph.elementDimens(context)[1] + 12,
                          right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular((30*DergiGraph.elementDimens(context)[0])/163)/2,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(175, 175, 175, 0.6),
                              blurRadius: 7,
                              offset: new Offset(0, 10)),
                        ],
                      ),
                    ))), // last button
            // ],
            //),
            // ),// Dergi BottomBar
          ],
        ));
  }
}
