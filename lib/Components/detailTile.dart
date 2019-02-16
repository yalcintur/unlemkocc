import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import './WebView.dart';

class DetailTile extends StatelessWidget {
  String url, title;

  DetailTile(this.title, this.url,);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) {
            return Webview();
          }));
        },
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(15.0),
          ),
          width: 100.0,
          height: 41.0,
          child: new Row(
            children: <Widget>[
              new Text(
                "$title",
                style: Theme.TextStyles.detailpagetiletitle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
