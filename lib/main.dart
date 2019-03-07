import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  void playYoutubeVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      fullScreen: true,
      apiKey: "<AIzaSyAfmD2cd6hDiLvXb_3EjOALmgq4yd-uSgU>",
      videoUrl: "https://www.youtube.com/watch?v=OLpeX4RRo28",
    );
  }

  @override
  void initState() {
    // TODO: implement initState

  }
  final controller = PageController(
    initialPage: 1,
  );

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: new SizedBox(
        height: 300.0,
        child: Row(
          children: <Widget>[
            Expanded(
            child : PageView(
              controller: controller,
              children: <Widget>[
                Player(),
                Center(
                  child: new Text("annen"),
                ),


              ],
            ),
            ),
          ],

        ),
      ),


       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
 
class Player extends StatefulWidget {
  @override
  _PlayerState createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  void playYoutubeVideo() {
    FlutterYoutube.playYoutubeVideoByUrl(
      fullScreen: true,
      apiKey: "<AIzaSyAfmD2cd6hDiLvXb_3EjOALmgq4yd-uSgU>",
      videoUrl: "https://www.youtube.com/watch?v=OLpeX4RRo28",
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    playYoutubeVideo();
  }
  @override
  Widget build(BuildContext context) {
    return new Container();
  }
}
