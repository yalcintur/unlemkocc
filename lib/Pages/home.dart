import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import 'package:carousel_pro/carousel_pro.dart';



class Home extends StatelessWidget {
  static String tag = 'home-page';


  List<NetworkImage> resimler=[
    new NetworkImage('https://drive.google.com/uc?export=download&id=1BC5x52YJU1Ij-nTaVHiI6ppcicYJnU1p'),
    new NetworkImage('https://drive.google.com/uc?export=download&id=1BC5x52YJU1Ij-nTaVHiI6ppcicYJnU1p'),
    new NetworkImage('https://drive.google.com/uc?export=download&id=1BC5x52YJU1Ij-nTaVHiI6ppcicYJnU1p'),


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
