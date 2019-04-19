import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import '../Components/ropSayac.dart';
import '../Components/Stackvideostile.dart';
import '../Model/videos.dart';
import '../Model/video.dart';
import '../Algorithms/dergimap.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../Algorithms/Cut.dart';
import 'package:flutter_youtube/flutter_youtube.dart';




class Ropo extends StatefulWidget {
  final RopoState state = new RopoState();
  void update(bool exp) {
    state.change(exp);
  }

  RopoState createState() => new RopoState();
}

class RopoState extends State<Ropo> {
  bool videomounted, expired;
  Video current = Video(
    id: "1",
    title: "ned",
  );
  int remday = 0,
      remhour = 0,
      remmin = 0,
      remsec = 0;

  void change(bool exp) {
    setState(() {
      this.expired = exp;
    });
  }

  void playYoutubeVideo(String url) {
    FlutterYoutube.playYoutubeVideoByUrl(
      fullScreen: true,
      apiKey: "<AIzaSyAfmD2cd6hDiLvXb_3EjOALmgq4yd-uSgU>",
      videoUrl: url,
    );
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
      width: MediaQuery
          .of(context)
          .size
          .width,
      child: new Container(
        margin: EdgeInsets.only(left: 15.0, right: 15.0),
        child: new Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new AutoSizeText(
              "BU HAFTAKİ RÖPORTAJA",
              style: Theme.TextStyles.ropsayacc,
              maxLines: 1,
            ),
            new Expanded(
              flex: 1,
              child: new Container(
                color: Colors.black,
              ),
            ),
            new Container(width: 10.0,),
            new Center(

              child: new FittedBox(child: Text(

                "$remday : $remhour : $remmin : $remsec",
                style: Theme.TextStyles.ropsayaccint,
                //maxLines: 1,
              )),)


          ],
        ),
      ),
    );
  }

  bool loaded = false;
  List<Video> videolar;
  Video timervideo;


  Future getlist() async {
    var val = await VideoDao.dergicallback();
    var wexpval = await WillExpire.dergicallback();


    setState(() {
      loaded = true;
      videolar = val;
      timervideo = wexpval;
    });
  }

  Future refreshList() async {
    var val = await VideoDao.refreshList();
    setState(() {
      loaded = true;
      videolar = val;
    });
  }

  void initState() {
    super.initState();
    getlist();
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
    if (current != null) {
      return Container(
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            new Container(
              child: new Column(
                children: <Widget>[
                  RopSayac(this),
                  new Expanded(
                      child: new SingleChildScrollView(
                        child: new Column(children: <Widget>[


                          thisweek(),
                          videoList(),


                        ],),
                      )

                  ),
                ],
              ),
            ),

            //new Image.asset("name"),
          ],
        ),
      );
    } else {
      return new Container(
        color: Colors.white,
        child: new Stack(
          children: <Widget>[
            new Container(
              child: new Column(
                children: <Widget>[
                  RopSayac(this),
                  new Expanded(
                      child: new SingleChildScrollView(
                        child: new Column(children: <Widget>[
                          unknownWeek(),
                          videoList(),
                        ],),
                      )

                  ),
                ],
              ),
            ),

            //new Image.asset("name"),
          ],
        ),
      );
      // return video
    }
  }

  Widget videoList() {
    if (loaded != false) {
      var andn = videolar.map((obj) =>
          VideoTile(1, obj.title, obj.link, RopoAlg
              .calculatebox(context)
              .height)).toList();
      return new Container(
        // height: videolar.length*(((140.0*(RopoAlg.calculatebox(context).height))/358)-50)+20,
          margin: EdgeInsets.only(top: 8.0, left: 4.0, right: 4.0),
          child: new Column(children: andn)
      );
    } else {
      return Text("loading");
    }
  }

  Widget thisweek() {
    if (loaded != false) {
      return new Container(
          child: new Column(children: <Widget>[
            new Stack(children: <Widget>[
              new GestureDetector(

                child: new Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    // height: 200,//400,//375/(400/MediaQuery.of(context).size.width),
                    child: new ClipPath(
                      child: new Image.network(videolar[0].konimg),
                      clipper: RopoClip(),
                    )),

              ),
              new Align(
                  alignment: Alignment.center,
                  child: new GestureDetector(
                      onTap: () {

    if (videolar[0].link != null) {
    playYoutubeVideo(videolar[0].link);
    //print(linkk);
    }

                      },
                      child: new Container(


                        child: new Center(child: new Icon(
                          Icons.play_arrow,
                          color: Color.fromRGBO(244, 14, 8, 0.66),
                          size: 35,)),


                        margin: EdgeInsets.only(top: ((400 * MediaQuery
                            .of(context)
                            .size
                            .width) / 375) - 45),
                        width: 90.0,
                        height: 90.0,
                        decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(45),
                          boxShadow: [
                            new BoxShadow(
                              color: Color.fromRGBO(175, 175, 175, 0.9),
                              blurRadius: 5,
                              offset: new Offset(0.0, 8.0),
                            )
                          ],
                        ),))),
            ],), //Button ve image
            new Container(height: 16.0),
            new Text(videolar[0].konname, style: TextStyle(fontSize: 40,
                fontFamily: "DINCondensedBold",
                color: Colors.black),),
            new Text("Müdür Yardımcısı", style: TextStyle(fontSize: 18,
                fontFamily: "DINCondensedBold",
                color: Color.fromRGBO(176, 176, 176, 1)),),

          ]));
    } else
      return new Container(child: new Text("loading"),);
  }

  Widget unknownWeek() {
    var atmisucstayla = TextStyle(fontSize: 18,
        fontFamily: "DINCondensedBold",
        color: Color.fromRGBO(176, 176, 176, 1));
    return new Container(
        child: new Column(children: <Widget>[
          new Stack(children: <Widget>[
            new GestureDetector(

              child: new Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  // height: 200,//400,//375/(400/MediaQuery.of(context).size.width),
                  child: new ClipPath(
                    child: new Image.asset("assets/qmark.jpg"),
                    clipper: RopoClip(),
                  )),
              onTap: () {
                if (current != null) {
                  playYoutubeVideo(current.link);
                }
              },
            ),
            new Align(
                alignment: Alignment.center,
                child: new Container(


                  child: new Center(child: new Icon(
                    Icons.mood_bad, color: Color.fromRGBO(244, 14, 8, 0.66),
                    size: 30.0,)),


                  margin: EdgeInsets.only(top: ((400 * MediaQuery
                      .of(context)
                      .size
                      .width) / 375) - 45),
                  width: 90.0,
                  height: 90.0,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(45),
                    boxShadow: [
                      new BoxShadow(
                        color: Color.fromRGBO(175, 175, 175, 0.9),
                        blurRadius: 5,
                        offset: new Offset(0.0, 8.0),
                      )
                    ],
                  ),)),
          ],), //Button ve image
          new Container(height: 16.0),
          new FittedBox(
              child: new Text(
                "Ufukta Bir Video Gözükmemekte", style: TextStyle(
                  fontSize: 40,
                  fontFamily: "DINCondensedBold",
                  color: Colors.black),)),
          new FittedBox(child: Text(
              "Video ekibi ÖB pizzası yemeye dalmıs olabilir."
              , style: atmisucstayla)),
          new FittedBox(child: Text(
              "Elif Hoca hepimizi disipline vermis olabilir"
              , style: atmisucstayla)),
          new FittedBox(child: Text(
              "Sınavlar baslamıs ve dusta aglıyor olabiliriz"
              , style: atmisucstayla)),
          new FittedBox(child: Text(
              "Uygulamayı satıp meksikaya kacmıs olabiliriz"
              , style: atmisucstayla)),
        ]));
  }


  List<String> lists = ["asdas", "adadsa"];

  @override
  Widget build(BuildContext context) {
    //   print(MediaQuery.of(context).size.width);

    return Container(
        color: Colors.white,
        child: rendervideoorui()
    );
  }
}

