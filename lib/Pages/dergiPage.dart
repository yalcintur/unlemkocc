import '../Model/dergis.dart';
import 'package:flutter/material.dart';
import '../Components/dergiElement.dart';
import '../Model/dergis.dart';
import '../Algorithms/dergimap.dart';
import '../Theme.dart' as Theme;

class DergiPage extends StatefulWidget {
  _DergiPageState createState() => _DergiPageState();
}

class _DergiPageState extends State<DergiPage> {
  
  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Theme.Colors.pagebackground,

      child: OrientationBuilder(
        builder: (context, orientation) {
          return new GridView.builder(
                      itemCount: DergiDao.dergis.length,

      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing: 1.0,crossAxisSpacing: 1.0,childAspectRatio: 0.75),
      itemBuilder: (BuildContext context, int index) {
        return Container(
                 alignment: Alignment.center,
                 child: Dergielemet(DergiDao.dergis[index],index),
              );
      },
  );
            }),


      // child: new CustomScrollView(
      // slivers: <Widget>[

      //   SliverGrid(
      //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
      //       maxCrossAxisExtent: 300.0,
            
      //       mainAxisSpacing: 1.0,
      //       crossAxisSpacing: 5.0,
      //       childAspectRatio: 0.75,
            
      //     ),
      //     delegate: SliverChildBuilderDelegate(
      //           (BuildContext context, int index) {
      //         return Container(
      //           alignment: Alignment.center,
      //           child: Dergielemet(DergiDao.dergis[index],index),
      //         );
      //       },
      //       childCount: DergiDao.dergis.length,
      //     ),
      //   ),
      // ],
      // ),
    
    );
  }
}