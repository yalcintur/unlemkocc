import 'package:flutter/material.dart';
import '../Components/detailTile.dart';
import '../Theme.dart' as Theme;

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

  _DergiDetailState(this.dergiimage, this.indexed);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  return Container(
          color: Theme.Colors.pagebackground,
          child: Column(

            children: <Widget>[
              new Hero(
                tag: indexed,
                child: new Container(
                  width: 183.0,
                  height: 241.1,
                  decoration: new BoxDecoration(
                      image: new DecorationImage(
                          image: new AssetImage(dergiimage),
                          fit: BoxFit.cover)),
                ),
              ),
              // İmage is over
              new Text("Yeni Sayı Yayında"),
              // Text is over
              /*new ListView.builder
            (
              itemCount: litems.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return new Text(litems[index]);
              }
          )*/
            ],
          ),
  );
  }
}
