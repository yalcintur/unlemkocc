import 'package:flutter/material.dart';
import 'dart:async';
import 'package:random_color/random_color.dart';
import '../Theme.dart' as Theme;



class Timerr extends StatefulWidget {
  String endpoint,titles,expiredtitle;
  Timerr(this.endpoint,this.titles,this.expiredtitle);
  _TimerState createState() => new _TimerState(endpoint,titles,expiredtitle);
}

class _TimerState extends State<Timerr> {



 static RandomColor _randomColor = RandomColor();

 Color _color = _randomColor.randomColor(
   colorBrightness: ColorBrightness.light,
  colorHue: ColorHue.red

 );

  var expired;
   String end,tit,exptit;
   static String endpoint,titles,expiredtitle;
  int remday = 0, remhour = 0, remmin = 0, remsec = 0;
  _TimerState(this.end,this.tit,this.exptit);
  
  var _now = DateTime.now();
  Timer _everySecond;
  var endpointparsed;


  Widget timerbox(){

    return Container(
      width: 375.0,
      height: 128.0,
      color: _color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new FittedBox(

          child: new Text("$tit",style: Theme.TextStyles.timerfont,),),
          new Container(height: 8.0,),
          new Text( "$remday : $remhour : $remmin : $remsec",style: Theme.TextStyles.kosebas),
          
        ],
      ),
    );

  }

 @override
  void dispose() {
    super.dispose();
    _everySecond.cancel();
  }

@override
  void initState() {
    super.initState();
    endpoint = end;
    titles = tit;
    expiredtitle = exptit;
    endpointparsed =DateTime.parse(endpoint);



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
        }else print("mount failure");
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