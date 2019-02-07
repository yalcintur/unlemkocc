import 'package:flutter/material.dart';
import '../Components/detailTile.dart';
import '../Theme.dart' as Theme;
import '../Model/detailBars.dart';
import '../Model/detailBar.dart';

class DergiDetail extends StatefulWidget {
  static String tag = 'dergi-detail';
  int indexed;
  var dergiimage;
  DergiDetail(this.dergiimage, this.indexed);
  @override
  _DergiDetailState createState() => _DergiDetailState(dergiimage, indexed);
}

class _DergiDetailState extends State<DergiDetail> {
  var dergiimage;
  int indexed;
  List<Detail> details;
  _DergiDetailState(this.dergiimage, this.indexed);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.details = DetailBars.callback();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.Colors.pagebackground,
      child: new Stack(children: <Widget>[
        new Container(
          child: new GestureDetector(
              onTap: () {
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
                    tag: indexed,
                    child: new Container(
                      width: 199.0,
                      height: 278.0,
                      decoration: new BoxDecoration(
                          image: new DecorationImage(
                              image: new AssetImage(dergiimage),
                              fit: BoxFit.cover)),
                    ),
                  ),
             ),

            new Container(height: 29.0),
            // İmage is over
            new Text(
              "Yeni Sayı Yayında",
              style: Theme.TextStyles.detailpagetitle,
            ),
            // Text is over
            new Expanded(
                flex: 1,
                child: new ListView.builder(
                    itemCount: details.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return DetailTile(
                          details[index].title, details[index].link);
                    }))
          ],
        ),
      ]),
    );
  }
}
