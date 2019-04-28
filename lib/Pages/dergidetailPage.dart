import 'package:flutter/material.dart';
import '../Components/detailTile.dart';
import '../Theme.dart' as Theme;
import '../Model/detailBars.dart';
import '../Model/dergi.dart';
import '../Model/detailBar.dart';

import '../Components/bottomtab.dart';

class DergiDetail extends StatefulWidget {
  static String tag = 'dergi-detail';
  int indexed;
  Dergi content;
  var dergiimage,baslik;
  DergiDetail(this.dergiimage, this.baslik,this.indexed,this.content);
  @override
  _DergiDetailState createState() => _DergiDetailState(dergiimage,baslik, indexed,content);
}

class _DergiDetailState extends State<DergiDetail> {
  var dergiimage,baslik;
  int indexed;
  Dergi content;
  List<Detail> details;
  bool loaded = false;
  _DergiDetailState(this.dergiimage,this.baslik, this.indexed,this.content);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future getlist() async {

    var val = await DetailBars.callback(indexed);
    setState(() {
      details = val;
      loaded = true;
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getlist();
  }



  Widget _isloaded(){
    double Elewidth = (253* MediaQuery.of(context).size.width)/375;
    double Eleheight = (Elewidth*351)/253;

    if(loaded == true){
      return new Scaffold(
        body:

        new Stack(children: <Widget>[
        new Container(
          child: new GestureDetector(
              onTap: () {

        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Bottomtab(startup: 0,);
        }));
      },
              child: new Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
                size: 30.0,
              )
          ),
          margin: EdgeInsets.only(top: 24.0+MediaQuery.of(context).padding.top, left: 10.0),
        ),
        Column(
          children: <Widget>[
        new Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top+13),
          width: Elewidth,
          child: new Stack(
            children: <Widget>[
              Align(
              alignment: Alignment.topCenter,
              child: new Container(

                height: Eleheight,
                width: Elewidth,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(209, 0, 0, 1),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 12,
                      offset: Offset(0, 2),
                      color: Color.fromRGBO(0, 0, 0, 0.7)
                    ),
                  ]
                ),

              )),

              new Container(
                margin: EdgeInsets.all(4),
                height: Eleheight-8,
                width: Elewidth-8,
                child: Image.network(dergiimage),
                //color: Colors.white,
              ),

              //Main Picture Ends
              new Container(

                margin: EdgeInsets.only(top: Eleheight-31),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(
                      width: 42,
                      height: 42,
                      child: new Center(
                        child: new Text(content.like.toString(),style: TextStyle(fontSize: 18,color: Color.fromRGBO(29,183,0,1),fontFamily: "DINCondensedBold"),),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(175, 175, 175, 0.6),
                              blurRadius: 7,
                              offset: new Offset(0, 10)),
                        ],
                      ),
                    ), // Like button end
                    new Container(width: Elewidth/14,),
                          new GestureDetector(onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (_) {
                              return Bottomtab(startup: 0,);
                            }));
                          }, child: new Container(
                          width: 62,
                          height: 62,
                          child: new Center(
                            child: new Icon(
                              Icons.pause,
                              size: 20,
                              color: Color.fromRGBO(244, 14, 8, 0.86),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(31),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(175, 175, 175, 0.6),
                                  blurRadius: 7,
                                  offset: new Offset(0, 10)),
                            ],
                          ),
                        )),
                    new Container(width: Elewidth/14,),
                    new Container(
                      width: 42,
                      height: 42,
                      child: new Center(
                        child: new Text(content.dislike.toString(),style: TextStyle(fontSize: 18,color: Color.fromRGBO(255,42,36,1),fontFamily: "DINCondensedBold"),)
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(175, 175, 175, 0.6),
                              blurRadius: 7,
                              offset: new Offset(0, 10)),
                        ],
                      ),
                    ), // Like

                  ],
                ),
              ),


            ],
          ),
        ),


            // Text is over
            new Expanded(
                child: new ListView.builder(
                    itemCount: details.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return DetailTile(
                          details[index].title, details[index].link,dergiimage,baslik,indexed,details[index].id,baslik.toString().toUpperCase()[0]);
                    })
    )
          ]),
    ]
        ));

    }else{
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: _isloaded()
    );
  }
}
