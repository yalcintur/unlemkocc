import 'package:flutter/material.dart';
import '../Pages/ropor.dart';
import '../Theme.dart' as Theme;
import 'dart:async';
import '../Model/video.dart';
import '../Model/videos.dart';
import 'package:auto_size_text/auto_size_text.dart';


class RopComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return null;
  }
}

class RopSayac extends StatefulWidget {
  RopoState parent;

  RopSayac(this.parent);
  _RopSayacState createState() => new _RopSayacState(parent);
}

class _RopSayacState extends State<RopSayac> {
 Video content;
 bool loaded;
  
  RopoState parent;
  _RopSayacState(this.parent);
  int remday = 0, remhour = 0, remmin = 0, remsec = 0;
  bool expired = false;
  var _now = DateTime.now();

  var endpoint;

  Timer _everySecond;
  final Ropo ropo = new Ropo();

  @override
  void dispose() {
    super.dispose();
    _everySecond.cancel();
  }

  Widget sayac(BuildContext context,){

    if(endpoint != null) {
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
            mainAxisAlignment: MainAxisAlignment.center,
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

              new Container(width: 25.0,),
              // new Center(
              //alignment: Alignment.centerRight,
              new SizedBox(
                height: 40.0,
                width: MediaQuery
                    .of(context)
                    .size
                    .width / 2.5,

                child: new FittedBox(child: new Text(


                  "$remday : $remhour : $remmin : $remsec",
                  style: Theme.TextStyles.ropsayaccint,
                  maxLines: 1,
                  textAlign: TextAlign.center,
                )),

              ),
            ],
          ),
        ),
      );
    }else return Container(
        color: Colors.black,
        height: 40.0,
        width: MediaQuery
        .of(context)
        .size
        .width,
    );
  }

 Future waitWhile([Duration pollInterval = Duration.zero]) {
   var completer = new Completer();
   check() {
     if (endpoint != null) {
       count();
       completer.complete();
     } else {
       new Timer(pollInterval, check);
     }
   }
   check();
   return completer.future;

 }


 void count(){

     // eğer videonun çıkacağı tarihten öndeysek
     //sayacı başlat
     _everySecond = Timer.periodic(Duration(seconds: 1), (Timer t) {
       if(content!= null){
       if (this.parent.mounted) {

         if (_now.isBefore(endpoint) == true ||
             _now
                 .difference(endpoint)
                 .inSeconds == 0) {
           //     bilge.updateexpired(false);
           expired = false;
           if (this.parent.mounted) {
             this.parent.setState(() {
               this.parent.expired = false;
             });
           }

           //debugPrint(_now.toString());
           _now = DateTime.now();
           var remai = endpoint.difference(_now);
           if (this.mounted) {
             setState(() {

               _now = DateTime.now();
               var remai = endpoint.difference(_now);
               remday = int.parse(remai.inDays.toString());
               remhour = int.parse(remai.inHours.toString()) % 24;
               remmin = int.parse(remai.inMinutes.toString()) % 60;
               remsec = int.parse(remai.inSeconds.toString()) % 60;


             });
           }
         } else {
           debugPrint("expired");
           if (this.parent.mounted) {
             this.parent.setState(() {
               this.parent.expired = true;
             });
           }

           //  bilge.updateexpired(false);
         }
       }
     }});
  }

 Future getlist() async {
  // var val = await VideoDao.dergicallback();
   var wexpval = await WillExpire.dergicallback();

   setState(() {
    loaded = true;
     //videolar = val;
      content = wexpval;
      endpoint = DateTime.parse(content.expdate);
   });
 }

  @override
  void initState() {
    super.initState();
    getlist();
    print(content);
    count();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: sayac(context),
    );
  }
}
