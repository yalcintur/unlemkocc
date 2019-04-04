import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import './WebView.dart';

class DetailTile extends StatelessWidget {
  String url, title;
  int indexed;
  var dergiimage,baslik;

  DetailTile(this.title, this.url,this.dergiimage,this.baslik, this.indexed);
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
            color: Colors.black,
            borderRadius: BorderRadius.circular(25.0),
          ),
          width: 100.0,
          height: 41.0,
          child: new Row(
            children: <Widget>[
              new Container(
                margin: EdgeInsets.only(left: 4.0,right: 16.0),
                height:34,
                width: 34,
                child: new Center(

                  child: new Material(type: MaterialType.transparency, child:new Text("B",style: Theme.TextStyles.detailpagetilecapital,)),
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
            ],
          ),
        ),
      ),
    );
  }
}
