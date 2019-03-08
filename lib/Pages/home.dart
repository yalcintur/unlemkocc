import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import 'package:carousel_pro/carousel_pro.dart';



class Home extends StatelessWidget {


  List<NetworkImage> resimler=[
    new NetworkImage('https://www.tccb.gov.tr/assets/resim/genel/receptayyiperdogan-bio.jpg'),
    new NetworkImage('https://i.pinimg.com/originals/18/10/e3/1810e308bbcc1fded5729492ff5124a2.jpg'),
    new NetworkImage('https://im.haberturk.com/2017/11/08/ver1510155923/elon-musk-ve-recep-tayyip-erdogan_1704957_620x410.jpg'),


  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.Colors.pagebackground,
      child: new Column(
        children: <Widget>[
          new Container(height: 30.0,),
          new SizedBox(
              height: 420.0,
              width: 300.0,
              child: new Carousel(
                images: resimler,
              )
          ),

        ],
      ),

    );
  }
}
