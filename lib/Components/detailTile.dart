import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import './WebView.dart';

class DetailTile extends StatelessWidget {
  String url, title;
  int indexed;
  var dergiimage,baslik,id,char;

  DetailTile(this.title, this.url,this.dergiimage,this.baslik, this.indexed,this.id,this.char);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return WebViewPlugin(url,dergiimage,baslik,indexed);
          }));
        },
        child: Container(
          decoration: new BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(0, 0, 0,0.6),
                blurRadius: 8,
                offset: Offset(0, 5)
              ),
            ],
            color: Colors.black,
            borderRadius: BorderRadius.circular(25.0),
          ),
          width: 100.0,
          height: 41.0,
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Row(children: <Widget>[
              new Container(
                margin: EdgeInsets.only(left: 4.0,right: 16.0),
                height:34,
                width: 34,
                child: new Center(

                  child: new Material(type: MaterialType.transparency, child:new Text("$char",style: Theme.TextStyles.detailpagetilecapital,)),
                ),
                decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              new Material(
                  type: MaterialType.transparency,
                  child: Text(
                "$title",
                style: Theme.TextStyles.detailpagetiletitle,
              )),
              ],),
//
//              new Container(
//                  child: new Row(
//                    children: <Widget>[
//                      new GestureDetector(
//                          onTap: (){
//                            print("Liked $id");
//                          },
//                          child: new Container(child:new Column(
//
//                        children: <Widget>[
//                          new Container(height: 4,),
//                        new Icon(Icons.thumb_up,size: 20,color: Colors.white,),
//                          new Container(height: 2,),
//
//                          new Text("12",style: TextStyle(fontSize: 10.0,color: Colors.white)),
//                      ],))),
//                      new Container(width: 10.0,),
//
//                      new GestureDetector(
//                          onTap: (){
//                            print("Disliked $id");
//                          },
//                          child: new Container(child:new Column(children: <Widget>[
//                        new Container(height: 4,),
//                        new Icon(Icons.thumb_down,size: 20,color: Colors.white,),
//                        new Container(height: 2,),
//                        new Text("12",style: TextStyle(fontSize: 10.0,color: Colors.white),),
//                      ],))),
//                      new Container(width: 25.0,)
//                    ],
//                  ),
//
//              ),
            ],
          ),
        ),
      ),
    );
  }
}
