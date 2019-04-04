import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import '../Pages/dergiPage.dart';
import '../Pages/koseler.dart';
import '../Pages/ropor.dart';
import '../Pages/timing.dart';
import '../Pages/home.dart';
import '../Algorithms/dergimap.dart';
import '../Components/ropSayac.dart';

class Bottomtab extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _BottomState createState() => _BottomState();

}
class _BottomState extends State<Bottomtab> {
  static double heightt = 0, widthh,element1=0,element2=0,element3=0,element4=0,element5=0;


  void initilizeRatio(){
    print("initilized");
    setState(() {
    element1 = TabAlgorithm.ratioAlgorithm(65, 65, widthh);
    element2 = TabAlgorithm.ratioAlgorithm(40, 40, widthh);
    element3 = TabAlgorithm.ratioAlgorithm(40, 40, widthh);
    element4 = TabAlgorithm.ratioAlgorithm(65, 65, widthh);
    element5 = TabAlgorithm.ratioAlgorithm(38, 31, widthh);
    });
    //////////////////////////////7
    setState(() {
      tabBar = new TabBar(

        tabs: [

          Tab(
            child: new Container(
              width: widthh,
              height: element1,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/kitap@3x.png"),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Tab(
            icon: new Container(
              width: widthh,
              height: element2,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/mikrofon.png"),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Tab(
            icon: new Container(
              width: widthh,
              height: element3,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/ev.png"), fit: BoxFit.fill),
              ),
            ),
          ),
          Tab(
            icon: new Container(
              width: widthh,
              height: element4,
              alignment: Alignment.center,
              decoration: new BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/koSEyaz@3x.png",
                    ),
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Tab(
              child: Image.asset(
                "assets/sayac.png",
                width: widthh,
                height: element5,
              )),
        ],
        //           labelStyle: ,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.white,



      );
    });
  }

  static Widget tabBarLoad(){

    if(heightt == 0){

      return new Container();


    }else return tabBar;


  }

  static Widget AppBarr() {
    return new AppBar(
      title: Center(

        child: Image.asset(
          "assets/unlem@3x.png",
          width: 144.0,
          height: 54.0,
        ),
      ),
      backgroundColor: Theme.Colors.tabbarbackground,
    );
  }

  @override
  Widget build(BuildContext context) {
    heightt =  MediaQuery.of(context).size.height;
    widthh = (MediaQuery.of(context).size.width-20)/5;
    initilizeRatio();
    print("Boy : $heightt");
    return new DefaultTabController(
        length: 5,
        child: new Scaffold(
          appBar: AppBarr(),
          body: new TabBarView(
            children: [
              new DergiPage(),
              new Ropo(),
              new Home(),
              new Koseler(),
              new Timing(),
            ],
          ),
          bottomNavigationBar: new Container(
            decoration: new BoxDecoration(
              //   borderRadius: BorderRadius.all(Radius.circular(1.0)),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 3.0,
                  offset: new Offset(0.0, -5.0),
                ),
              ],
            ),
            child: tabBar,
          ),
          backgroundColor: Theme.Colors.tabbarbackground,
        ),
      );

  }

  static var tabBar = new TabBar(

    tabs: [

      Tab(
        
        //child: Image.asset('assets/BottomBar1.png',scale: 1,width: 32,height: 32,),
        
        child: new Container(
          width: 64.0,
          height: 32.0,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/BottomBar1.png"),
              //  fit: BoxFit.fill,

            ),
          ),
        ),
      ),
      Tab(
        icon: new Container(
          width: 64.0,
          height: 64.0,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/BottomBar2.png"),
                fit: BoxFit.fill),
          ),
        ),
      ),
      Tab(
        icon: new Container(
          width: 64.0,
          height: 64.0,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/BottomBar3.png"), fit: BoxFit.fill),
          ),
        ),
      ),
      Tab(
        icon: new Container(
          width: 64.0,
          height: 64.0,
          alignment: Alignment.center,
          decoration: new BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                    "assets/BottomBar1.png",
                ),
                fit: BoxFit.fill),
          ),
        ),
      ),
      Tab(
          child: Image.asset(
            "assets/BottomBar1.png",
            width: 64.0,
            height: 64.0,
          )),
    ],
    //           labelStyle: ,
    labelColor: Colors.white,
    unselectedLabelColor: Colors.white,
  );
}










