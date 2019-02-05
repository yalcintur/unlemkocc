import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;

class DetailTile extends StatelessWidget {
  String url, title;

  DetailTile(this.title, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {},
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
