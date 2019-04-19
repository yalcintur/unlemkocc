import 'package:flutter/material.dart';
import 'dart:async';
import 'package:random_color/random_color.dart';
import '../Theme.dart' as Theme;

class Timerr extends StatefulWidget {
  String endpoint, titles, expiredtitle;
  var index,Llenght;
  Timerr(this.endpoint, this.titles, this.expiredtitle,this.index,this.Llenght);
  _TimerState createState() => new _TimerState(endpoint, titles, expiredtitle,index,Llenght);
}

class _TimerState extends State<Timerr> {
  var index,Llenght;

  var expired;
  String end, tit, exptit;

  static String endpoint, titles, expiredtitle;
  int remday = 0, remhour = 0, remmin = 0, remsec = 0;
  _TimerState(this.end, this.tit, this.exptit,this.index,this.Llenght);

  var _now = DateTime.now();
  Timer _everySecond;
  var endpointparsed;

  Widget timerbox() {
    if(expiredtitle != null && endpoint != null && titles != null) {
      if (expired != true) {
        return Container(
          width: 375.0,
          height: 128.0,
          color: Color.fromRGBO((255 - index * 10).toInt(),
              (200 - (index * (200 / Llenght))).toInt(),
              (200 - (index * (200 / Llenght))).toInt(), 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new SizedBox(
                  width: 345.0,
                  height: 40.0,
                  child: new FittedBox(
                    child: new Text(
                      "${tit.toString().toUpperCase()}",
                      style: Theme.TextStyles.timerfont,
                    ),
                  )),
              new Container(
                height: 8.0,
              ),
              new SizedBox(
                  width: 345.0,
                  height: 50.0,
                  child: new FittedBox(
                      child: new Text("$remday : $remhour : $remmin : $remsec",
                        style: TextStyle(color: Color(0xFFffffff),
                            fontFamily: 'DINCondensedBold',
                            fontSize: 45.0),
                      ))),
            ],
          ),
        );
      } else {
        return Container(
          width: 365.0,
          height: 128.0,
          color: Color.fromRGBO((255 - index * 10).toInt(),
              (200 - (index * (200 / Llenght))).toInt(),
              (200 - (index * (200 / Llenght))).toInt(), 1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new SizedBox(
                  width: 345.0,
                  height: 40.0,
                  child: new FittedBox(
                    child: new Text(
                      "${tit.toString().toUpperCase()}",
                      style: Theme.TextStyles.timerfont,
                    ),
                  )),
              new Container(
                height: 8.0,
              ),
              new SizedBox(
                  width: 345.0,
                  height: 50.0,
                  child: new FittedBox(
                      child:
                      new Text("$exptit", style: Theme.TextStyles.kosebas))),
            ],
          ),
        );
      }
    }else{
      return new Container(child: Text("Bir Hata Oluştu!!", style: TextStyle(color: Color(0xFFffffff),
          fontFamily: 'DINCondensedBold',
          fontSize: 45.0),
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
    _everySecond.cancel();
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      endpoint = end;
      titles = tit;
      expiredtitle = exptit;
    });


    try {
      endpointparsed = DateTime.parse(endpoint);
    }catch(e){
      print(e);
    }


    //  RopoState bilge = new RopoState();

    // eğer videonun çıkacağı tarihten öndeysek
    //sayacı başlat
    _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
      if (_now.isBefore(endpointparsed) == true ||
          _now.difference(endpointparsed).inSeconds == 0) {
        //     bilge.updateexpired(false);
        setState(() {
          expired = false;
        });

        //    debugPrint(_now.toString());

        _now = DateTime.now();
        var remai = endpointparsed.difference(_now);

        if (this.mounted) {
          setState(() {
            _now = DateTime.now();
            var remai = endpointparsed.difference(_now);
            remday = int.parse(remai.inDays.toString());
            remhour = int.parse(remai.inHours.toString()) % 24;
            remmin = int.parse(remai.inMinutes.toString()) % 60;
            remsec = int.parse(remai.inSeconds.toString()) % 60;
          });
        } else
          print("mount failure");
      } else {
        setState(() {
          expired = true;
        });

        //    debugPrint("expired");

        //  bilge.updateexpired(false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: timerbox(),
    );
  }
}
