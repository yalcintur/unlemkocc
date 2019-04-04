import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import '../Pages/dergidetailPage.dart';
import '../Theme.dart' as Theme;




class WebViewPlugin extends StatefulWidget {
  String url;
  int indexed;
  var dergiimage,baslik;
  WebViewPlugin(this.url,this.dergiimage,this.baslik, this.indexed);

  @override
  WebViewState createState() => new WebViewState(url,dergiimage,baslik,indexed);

}



class WebViewState extends State<WebViewPlugin> {

  bool shallwe;
  String url;// = "https://www.brookfield.hants.sch.uk/subpage-content/content-pdfs/exams11/English/Modern%20Text/An%20Inspector%20Calls_text.pdf";
  int indexed;
  var dergiimage,baslik;
  WebViewState(this.url,this.dergiimage,this.baslik, this.indexed);

  double pdfwidth,pdfheight;
  String _platformVersion = 'Unknown';

  @override
  void dispose() {
    // TODO: implement dispose

    PdfViewerPlugin.close();
    setState(() {
      shallwe = false;
    });
    super.dispose();
  }
  @override
  initState() {
    super.initState();
    setState(() {
      shallwe = true;
    });
    initPlatformState();
  //  print(url);

  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return new File('$path/teste.pdf');
  }

  Future<File> writeCounter(Uint8List stream) async {
    final file = await _localFile;

    // Write the file
    return file.writeAsBytes(stream);
  }

  Future<bool> existsFile() async {
    final file = await _localFile;
    return file.exists();
  }
  Future<Uint8List> fetchPost() async {
    final response =
    await http.get(url);
    final responseJson = response.bodyBytes;

    return responseJson;
  }

  initPlatformState() async {
    String platformVersion;
    try {

      writeCounter(await fetchPost());
      var x = await existsFile();
      print(shallwe);
      if(shallwe){
        PdfViewerPlugin.getPdfViewer((await _localFile).path, 80.0, pdfwidth , pdfheight-80);
      }


    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted)
      return;

    setState(() {
      if(shallwe){
      _platformVersion = platformVersion;
      }
    });
  }
 final keyy =GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    pdfheight = MediaQuery.of(context).size.height;
    pdfwidth = MediaQuery.of(context).size.width;

    return new MaterialApp(
      home: new Scaffold(
        key: keyy,
        appBar: new AppBar(
          key: new Key("annen"),
      title: new Stack(
      children:[
        new Container(margin: EdgeInsets.only(top: 15),child: new GestureDetector( onTap: (){


          PdfViewerPlugin.close();
//          Navigator.push(context, MaterialPageRoute(builder: (_) {
//            return DergiDetail(dergiimage,baslik,indexed);
//          }));
        Navigator.pop(context);

        }, child: new Icon(Icons.arrow_back_ios,size: 30.0,))),
      Center(

      child: Image.asset(
        "assets/unlem@3x.png",
        width: 144.0,
        height: 54.0,
      ),

    )]),
    backgroundColor: Theme.Colors.tabbarbackground,
    ),


        body: new Center(

        ),
      ),
    );

  }
}

