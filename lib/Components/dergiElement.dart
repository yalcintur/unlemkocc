import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import '../Model/dergi.dart';
import '../Pages/dergidetailPage.dart';
import '../Algorithms/dergimap.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Dergielemet extends StatelessWidget {
  Dergi dergi;
  int indexed;
  Dergielemet(this.dergi, this.indexed);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: DergiGraph.elementDimens(context)[0],
      height: DergiGraph.elementDimens(context)[1]+33,
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return DergiDetail(dergi.image, dergi.name, indexed);
              }));
            },
            child: new Container(
              width: DergiGraph.elementDimens(context)[0],
              height: DergiGraph.elementDimens(context)[1],
              child: new Stack(
                children: <Widget>[
                  new Container(
                    color: Theme.Colors.dergigray,
                    width: DergiGraph.elementDimens(context)[0],
                    height: DergiGraph.elementDimens(context)[1],
                  ),
                  new Hero(
                    key: Key(indexed.toString() + "asd"),
                    tag: indexed,
                    child: new Container(
                      margin: new EdgeInsets.all(6.0),
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
        //  new Container(height: 25,),
          new Container(
            //margin: EdgeInsets.only(bottom: 25.0),
            child: new Stack(
              children: <Widget>[
                new Container(
                  width: DergiGraph.elementDimens(context)[0],
                  height: 25.0,
                  child: new Opacity(
                    opacity: 0.44,
                    child: new Container(
                      width: DergiGraph.elementDimens(context)[0],
                      height: 25.0,
                      color: Theme.Colors.dergigray,
                    ),
                  ),
                ),
                new Center(
                  child: new Container(
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Container(
                          // margin: EdgeInsets.only(left: 35.0),
                          child: new Image.asset(
                            "assets/goZ.png",
                            width: 21.0,
                            height: 21.0,
                          ),
                        ),
                        new Container(
                          width: 4.0,
                        ),
                        new AutoSizeText(
                          "20",
                          style: TextStyle(fontSize: 10.0),
                          minFontSize: 3.0,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        new Container(
                          width: 7.0,
                        ),
                        new Image.asset(
                          "assets/like.png",
                          width: 25.0,
                          height: 25.0,
                        ),
                        new AutoSizeText(
                          "30",
                          style: TextStyle(fontSize: 10.0),
                          minFontSize: 3.0,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
