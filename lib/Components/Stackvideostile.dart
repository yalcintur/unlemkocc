import 'package:flutter/material.dart';
import '../Theme.dart' as Theme;
import '../Model/videos.dart';
import 'package:flutter_youtube/flutter_youtube.dart';


class VideoTile extends StatelessWidget {
  int index;
  var title;
  String linkk;
  VideoTile(this.index, this.title,this.linkk);

  void playYoutubeVideo(String url) {
    FlutterYoutube.playYoutubeVideoByUrl(
      fullScreen: true,
      apiKey: "<AIzaSyAfmD2cd6hDiLvXb_3EjOALmgq4yd-uSgU>",
      videoUrl: url,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new GestureDetector(
        onTap: (){
          if(linkk != null){
            playYoutubeVideo(linkk);
            //print(linkk);
          }



        },
      child:new Container(
        margin: EdgeInsets.only(top: 15.0),
        child: Row(
          children: <Widget>[
            new Image.network(
              "https://drive.google.com/uc?export=download&id=1XfZsCxRMQBvx_3idaRk-py7nOGXMxwRw",
              width: 140.0,
              height: 76.0,
            ),
            //new Container(width:140.0 ,height: 76.0, color: Colors.grey,),
            new Container(
              margin: EdgeInsets.only(left: 10.0, right: 10.0),
              width: 168.0,
              child: new Text(title),
            ),
          ],
        ),
      )),
    );
  }
}
//https://drive.google.com/uc?export=download&id=1XfZsCxRMQBvx_3idaRk-py7nOGXMxwRw
