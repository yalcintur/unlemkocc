import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import './bottomtab.dart';
import 'package:flutter/services.dart';
import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;
import './bottomtab.dart';
import '../Theme.dart' as Theme;

class Webview extends StatefulWidget {
  @override
  WebViewState createState() => new WebViewState();
}

class WebViewState extends State<Webview> {
  double pdfwidth,pdfheight;
  String _platformVersion = 'Unknown';

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    PdfViewerPlugin.close();
  }
  @override
  initState() {
    super.initState();
    initPlatformState();
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
    await http.get('https://www.brookfield.hants.sch.uk/subpage-content/content-pdfs/exams11/English/Modern%20Text/An%20Inspector%20Calls_text.pdf');
    final responseJson = response.bodyBytes;

    return responseJson;
  }

  initPlatformState() async {
    String platformVersion;
    try {

      writeCounter(await fetchPost());
      var x = await existsFile();
      PdfViewerPlugin.getPdfViewer((await _localFile).path, 80.0, pdfwidth , pdfheight-80);

    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted)
      return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    pdfheight = MediaQuery.of(context).size.height;
    pdfwidth = MediaQuery.of(context).size.width;
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
      title: new Stack(
      children:[
        new Container(margin: EdgeInsets.only(top: 15),child: new GestureDetector( onTap: (){

          Navigator.pop(context);

        }, child: new Icon(Icons.arrow_back_ios,size: 30.0,))),
      Center(

      child: Image.asset(
        "assets/auora@2x.png",
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