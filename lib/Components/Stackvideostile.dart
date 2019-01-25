import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import '../Model/videos.dart';

class VideoTile extends StatelessWidget {
  int index;

  VideoTile(this.index);

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Container(
        margin: EdgeInsets.only(top: 15.0),
      child: Row(
        children: <Widget>[
          new Image.network("https://drive.google.com/uc?export=download&id=1XfZsCxRMQBvx_3idaRk-py7nOGXMxwRw",width:140.0 ,height: 76.0,),
          //new Container(width:140.0 ,height: 76.0, color: Colors.grey,),
          new Container(
            margin: EdgeInsets.only(left: 10.0,right: 10.0),
            width: 168.0,
            child: new Text(VideoDao.videos[index].title),
          ),
        ],
      ),
      ),
    );
  }
} 
//https://drive.google.com/uc?export=download&id=1XfZsCxRMQBvx_3idaRk-py7nOGXMxwRw