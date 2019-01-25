import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import '../Components/ropSayac.dart';
import '../Components/Stackvideostile.dart';
import '../Model/videos.dart';

class Ropo extends StatefulWidget {
  final RopoState state = new RopoState();
  void update(bool exp) {
    state.change(exp);
  }

  RopoState createState() => new RopoState();
}

class RopoState extends State<Ropo> {
  bool videomounted, expired;
  int remday = 0, remhour = 0, remmin = 0, remsec = 0;

  void change(bool exp) {
    setState(() {
      this.expired = exp;
    });
  }

  Widget updatetimer(int rday, rhour, rmin, rsec) {
    setState(() {
      remday = rday;
      remhour = rhour;
      remmin = rmin;
      remsec = rsec;
    });
  }

  Widget sayac(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 40.0,
      width: MediaQuery.of(context).size.width,
      child: new Container(
        margin: EdgeInsets.only(left: 15.0, right: 15.0),
        child: new Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              "BU HAFTAKİ RÖPORTAJA",
              style: Theme.TextStyles.ropsayacc,
            ),
            new Expanded(
              flex: 1,
              child: new Container(
                color: Colors.black,
              ),
            ),
            new Text(
              "$remday : $remhour : $remmin : $remsec",
              style: Theme.TextStyles.ropsayaccint,
            ),
          ],
        ),
      ),
    );
  }

  Widget konukyazi() {
    // BU HAFTAKİ KONUĞUMUZ
    return new Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Text(
          "BU HAFTAKİ",
          style: Theme.TextStyles.koseice,
        ),
        new Text(
          "KONUĞUMUZ",
          style: Theme.TextStyles.koseice,
        ),
      ],
    );
  }

  Widget konuk(String ad, var img) {
    // Yuvarlak Şeklindeki Karakter Fotoğğğğğğrafı ve Çerçevesi
    return new Container(
      child: new Column(
        children: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Container(
                width: 226.0,
                height: 226.0,
                decoration: new BoxDecoration(
                    shape: BoxShape.circle, color: Theme.Colors.pagebackground),
              ),
              Container(
                width: 215.0,
                height: 215.0,
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: new AssetImage(img),
                  ),
                ),
              ),
            ],
          ),
          new Container(
            height: 12.0,
          ),
          new Text(
            ad,
            style: Theme.TextStyles.kosebas,
          ),
        ],
      ),
    );
  }

  void initState() {
    super.initState();
  }

  Widget updateexpired(bool expiredd) {
    setState(() {
      expired = expiredd;
    });
  }

  Widget didvideomounted() {
    if (expired == true) {
      return new Text("video");
    } else
      return new Container(
        width: 226.0,
        height: 226.0,
        decoration: new BoxDecoration(
            shape: BoxShape.circle,
            border: new Border.all(
                width: 5.0, color: Theme.Colors.roportajheroborder)),
      );
  }

  Widget rendervideoorui() {
    if (expired == false) {
      return new Column(
        children: <Widget>[
          Container(
            height: 8.0,
          ),
          konukyazi(),
          Container(
            height: 60.0,
          ),
          konuk("Ayşe Alan", "assets/ayseAlan.png"),
        ],
      );
    } else {
      return new Text("Video Geldi :D");
      // return video
    }
  }

  Widget stackvideos() {
    return new Container(
      decoration: new BoxDecoration(
        color: Theme.Colors.tabbarbackground,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      margin: EdgeInsets.only(top: 40.0, bottom: 10.0),
      width: 358.0,
      height: 343.0,
      child: Column(
        children: <Widget>[
          Container(
            // Üstteki bar
            width: 358.0,
            height: 46.0,
            decoration: new BoxDecoration(
              color: Theme.Colors.stackvideostopbar,
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              boxShadow: <BoxShadow>[
                new BoxShadow(
                  color: Colors.black12,
                  blurRadius: 3.0,
                  offset: new Offset(0.0, 7.0),
                ),
              ],
            ),

            child: Center(
              child: new Text(
                "BENCE Bİ’ ÖNCEKİLERE DE GÖZ AT",
                style: Theme.TextStyles.stackvideotitle,
              ),
            ),
          ), //üstteki bar bitti
          videoList(),
        ],
      ),
    );
  }

  Widget videoList() {
    return new Container(
      margin: EdgeInsets.only(top: 8.0,left: 4.0,right: 4.0),
      height: 285,
      child: new ListView.builder(
          itemCount: VideoDao.videos.length,
          itemBuilder: (BuildContext ctxt, int index) {
            return VideoTile(index);
          }),
    );
  }

  List<String> lists = ["asdas", "adadsa"];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.Colors.pagebackground,
      child: new Stack(
        children: <Widget>[
          new Container(
            margin: EdgeInsets.only(left: 0.0, top: 37.0),
            child: Image.asset(
              "assets/k@3x.png",
              // fit: BoxFit.fill,
            ),
          ),
          new Container(
            child: new Column(
              children: <Widget>[
                RopSayac(this),
                new Expanded(
                  child: CustomScrollView(
                    slivers: <Widget>[
                      SliverToBoxAdapter(
                        child: new Column(
                          children: <Widget>[
                            rendervideoorui(),
                            new Container(
                              height: 40.0,
                            ),
                            stackvideos(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          //new Image.asset("name"),
        ],
      ),
    );
  }
}
