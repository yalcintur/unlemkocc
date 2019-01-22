import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import '../Model/timers.dart';
import '../Components/timer.dart';
class Timing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.Colors.pagebackground,
      child: new  ListView.builder(
  padding: EdgeInsets.all(8.0),
  
  itemExtent: 132.0,
  itemCount: Timers.timers.length,
  itemBuilder: (BuildContext context, int index) {
    return Timerr(Timers.timers[index].enddate,Timers.timers[index].title,Timers.timers[index].expiredtext);
  },
    ));
  }
}