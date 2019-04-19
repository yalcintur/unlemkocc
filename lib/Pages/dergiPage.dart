import '../Model/dergis.dart';
import '../Model/dergi.dart';
import 'package:flutter/material.dart';
import '../Components/dergiElement.dart';
import '../Model/dergis.dart';
import '../Algorithms/dergimap.dart';
import '../Theme.dart' as Theme;

class DergiPage extends StatefulWidget {
  _DergiPageState createState() => _DergiPageState();
}

class _DergiPageState extends State<DergiPage> {
  var dergiler;
  bool loaded = false;

  Future getlist() async {
    var val = await DergiDao.dergicallback();
    setState(() {
      loaded = true;
      dergiler = val;
    });
  }

  Future refreshList() async {
    var val = await DergiDao.refreshList();
    setState(() {
      loaded = true;
      dergiler = val;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlist();

//    setState(() {
//      dergiler = DergiDao.dergicallback();
//    });
  }

  Widget checkload() {
    if (loaded == true) {
      return GridLister();
    } else {
      return new Text("loading");
    }
  }

  Widget GridLister() {
    return new Center(child: OrientationBuilder(builder: (context, orientation) {
      return RefreshIndicator(
        onRefresh: refreshList,
        child: new GridView.builder(
          padding: EdgeInsets.only(top: 15.0),
          itemCount: dergiler.length,
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20.0,
              crossAxisSpacing: 1.0,
              childAspectRatio: 0.69),//(MediaQuery.of(context).size.height/900)-(MediaQuery.of(context).size.height/4000)),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              child: Dergielemet(dergiler[index], index),
            );
          },
        ),
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white
      ,
      child: checkload(),
//      child: OrientationBuilder(
//        builder: (context, orientation) {
//          return new GridView.builder(
//                      itemCount: dergiler.length,
//
//      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:2,mainAxisSpacing: 1.0,crossAxisSpacing: 1.0,childAspectRatio: 0.75),
//      itemBuilder: (BuildContext context, int index) {
//        return Container(
//                 alignment: Alignment.center,
//                 child: Dergielemet(dergiler[index],index),
//              );
//      },
//  );
//            }),

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
