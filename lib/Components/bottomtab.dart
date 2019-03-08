import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import '../Pages/dergiPage.dart';
import '../Pages/koseler.dart';
import '../Pages/ropor.dart';
import '../Pages/timing.dart';
import '../Pages/home.dart';
import '../Components/ropSayac.dart';

class Bottomtab extends StatelessWidget {
    static String tag = 'home-page';

   static Widget AppBarr(){
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
    return new DefaultTabController(
      length: 5,
      child: new Scaffold(
        appBar: AppBarr(),
        body: TabBarView(
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
          child: new TabBar(
            
            tabs: [
              Tab(
                child: new Container(
                  width: 65.0,
                  height: 65.0,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/kitap.png"),
                        fit: BoxFit.fill),
                  ),
                ),
              ),
              Tab(
                icon: new Container(
                  width: 40.0,
                  height: 40.0,
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
                  width: 40.0,
                  height: 40.0,
                  alignment: Alignment.center,
                  decoration: new BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/ev.png"), fit: BoxFit.fill),
                  ),
                ),
              ),
              Tab(
                icon: new Container(
                  width: 65.0,
                  height: 65.0,
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
                width: 31.0,
                height: 38.0,
              )),
            ],
            //           labelStyle: ,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white,
          ),
        ),
        backgroundColor: Theme.Colors.tabbarbackground,
      ),
    );
  }
}
