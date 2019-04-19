import 'package:flutter/material.dart';
import '../Model/kose.dart';
import '../Pages/koseDetailPage.dart';
import '../Algorithms/dergimap.dart';
import 'dart:ui';
import '../Theme.dart' as Theme;

class Kosetile extends StatelessWidget {
  Dimension calculatedimens(double width) {
    double height = ((width * 249) ~/ 375).toDouble();
    return Dimension(width, height);
  }

  Kose content;
  int index;
   Kose baban ;
  Kosetile({
  this.content = null

    ,
    this.index});
  //Kosetile(this.imageasset, this.kosebaslik, this.koseicerik);
  @override
  Widget build(BuildContext context) {
    return new Container(margin: EdgeInsets.only(left: 6.0,bottom: 8.0,right: 6.0),child: new LayoutBuilder(builder: (context, costaints) {
      return new GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (_) {
              return KoseDetail(content: content, index:  this.index);
            }));

          },
          child: new Container(
        width: calculatedimens(MediaQuery.of(context).size.width-12).width,
        height: calculatedimens(MediaQuery.of(context).size.width-12).height,
        child: new Stack(
          children: <Widget>[
            new Hero(tag:"$index kose",
            child: new Container(
//
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(10),//MediaQuery.of(context).size.width-16/87),
//
//              ),
            //color: Colors.yellow,
                child: new ClipRRect( borderRadius: BorderRadius.circular(10),child: new Image.network(content.link,
                  width: calculatedimens(MediaQuery.of(context).size.width-12).width,
                  height: calculatedimens(MediaQuery.of(context).size.width-12).height,
                )),
            )),
            new Container(
              width: calculatedimens(MediaQuery.of(context).size.width).width,
              height: calculatedimens(MediaQuery.of(context).size.width).height,
              child: new Column(
                children: [
                  new Text(
                    content.title.toString(),
                    style: Theme.TextStyles.KoseTitle,
                    maxLines: 2,
                  ),
                  new Container(
                    height: 5.0,
                  ),
                  new Container(
                    child: new Text(
                      content.author.toString(),
                      style: Theme.TextStyles.koseyazar,
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ],
                crossAxisAlignment: CrossAxisAlignment.start,
              ),
              margin: EdgeInsets.only(
                top: ((120 * calculatedimens(MediaQuery.of(context).size.width-12).height) / 230)
                    .toDouble(),
                left: 15.0,
              ),
            ),
          ],
        ),
      ));
      }));
  }
}
