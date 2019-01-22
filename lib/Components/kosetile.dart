import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;

class Kosetile extends StatelessWidget {
  var imageasset, kosebaslik, koseicerik;
  Kosetile(this.imageasset, this.kosebaslik, this.koseicerik);
  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: EdgeInsets.only(bottom: 7.0),
      // child: new Flexible(
      // flex: 1,
      child: new Stack(
        children: <Widget>[
          new Container(
            width: 400.0,
            height: 165.0,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(imageasset), fit: BoxFit.fill),
            ),
          ),
          // new Image.asset(
          //   imageasset,
          //   width: 362.0,
          //   height: 127.0,
          // ),
          new Column(
            children: <Widget>[
              new Container(
                                alignment: Alignment(-1.0, 0.0),

                margin: EdgeInsets.only(top: 26.0, left: 6.0),
                child: new Text(
                  kosebaslik,
                  style: Theme.TextStyles.kosebas,
                  textAlign: TextAlign.left,
                ),
              ),
              new SizedBox(
                height: 10.0,
              ),
              new Container(
                alignment: Alignment(-1.0, 0.0),
                margin: EdgeInsets.only(top: 0.0, left: 10.0),
                child: new Text(
                  koseicerik,
                  style: Theme.TextStyles.koseice,
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          )
        ],
        // ),
      ),
    );
  }
}
