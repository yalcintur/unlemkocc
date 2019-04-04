import 'package:flutter/material.dart';
import '../Components/detailTile.dart';
import '../Theme.dart' as Theme;
import '../Model/detailBars.dart';
import '../Model/detailBar.dart';
import '../Components/bottomtab.dart';

class DergiDetail extends StatefulWidget {
  static String tag = 'dergi-detail';
  int indexed;
  var dergiimage,baslik;
  DergiDetail(this.dergiimage, this.baslik,this.indexed);
  @override
  _DergiDetailState createState() => _DergiDetailState(dergiimage,baslik, indexed);
}

class _DergiDetailState extends State<DergiDetail> {
  var dergiimage,baslik;
  int indexed;
  List<Detail> details;
  bool loaded = false;
  _DergiDetailState(this.dergiimage,this.baslik, this.indexed);

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
    if(loaded == true){
      return new Stack(children: <Widget>[
        new Container(
          child: new GestureDetector(
              onTap: () {
//                Navigator.push(context, MaterialPageRoute(builder: (_) {
//                  return Bottomtab();
//                }));
              Navigator.pop(context);
              },
              child: new Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30.0,
              )
          ),
          margin: EdgeInsets.only(top: 24.0, left: 10.0),
        ),
        Column(
          children: <Widget>[
//            new Container(
//              margin: EdgeInsets.only(top: 32.0),
//              color: Colors.black,
//              width: 211,
//              height: 291,
            new Container(
              decoration: BoxDecoration(
                  border: new Border.all(color: Colors.black,width: 6.0)

              ),
              margin: EdgeInsets.all(6.0),
              child: Hero(
                key: Key("sda"),
                tag: indexed,
                child: new Container(
                  width: 199.0,
                  height: 278.0,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new NetworkImage(dergiimage),
                          fit: BoxFit.cover)),
                ),
              ),
            ),

            new Container(height: 29.0),
            // İmage is over
            new Material(
            type: MaterialType.transparency,
            child: new Text(
              baslik,
              style: Theme.TextStyles.detailpagetitle,
            )),
            // Text is over
            new Expanded(
                flex: 1,
                child: new ListView.builder(
                    itemCount: details.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return DetailTile(
                          details[index].title, details[index].link,dergiimage,baslik,indexed);
                    }))
          ],
        ),
      ]);


    }else{

      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.Colors.pagebackground,
      child: _isloaded()
    );
  }
}
