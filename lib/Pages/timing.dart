import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import '../Model/timers.dart';
import '../Components/timer.dart';
import 'dart:async';

class Timing extends StatefulWidget {
  @override
  _TimingState createState() => _TimingState();
}

class _TimingState extends State<Timing> {

  List<Timerrr> timerList = [];

  Future<List<Timerr>> getTimer() async{
    var amk = await Timers.Timerrrcallback();
    setState(() {
      timerList = amk;
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTimer();

  }




  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.Colors.pagebackground,
        child: new ListView.builder(
          // padding: EdgeInsets.all(8.0),
          padding: EdgeInsets.only(top: 0),
          itemExtent: 132.0,
          itemCount: timerList.length,
          itemBuilder: (BuildContext context, int index) {
            return Timerr(
               timerList[index].enddate,
               timerList[index].title,
               timerList[index].expiredtext,
                index,
               timerList.length);
          },
        ));
  }
}
