import 'package:flutter/material.dart';


import 'dart:async';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

import 'package:flutter/foundation.dart';

import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';

class WebViewPlugin extends StatefulWidget {
  String url;
  int indexed;
  var dergiimage, baslik;
  WebViewPlugin(this.url, this.dergiimage, this.baslik, this.indexed);

  @override
  WebViewState createState() =>
      new WebViewState(url, dergiimage, baslik, indexed);
}

class WebViewState extends State<WebViewPlugin> {
  bool isit = true;

  bool shallwe = false;
  String
      urll = "http://africau.edu/images/default/sample.pdf";
  int indexed;
  var dergiimage, baslik;
  WebViewState(this.urll, this.dergiimage, this.baslik, this.indexed);

  String pathPDF = null;



  @override
  void initState() {
    super.initState();
    shallwe = true;
    createFileOfPdfUrl().then((f) {
      setState(() {
        pathPDF = f.path;
        shallwe = true;
        print("sss");
        print(pathPDF);
      });
    });
  }

  Future<File> createFileOfPdfUrl() async {
    final url = urll;
    print(urll);
    final filename = url.substring(url.lastIndexOf("/") + 1);
    var request = await HttpClient().getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/$filename');
    await file.writeAsBytes(bytes);

    return file;
  }


  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    setState(() {
       shallwe = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return pathPDF == null ?  Container(color: Colors.white,child: Center(child: new Image.asset("assets/prgrInd.gif"),),) : PDFScreen(this) ;
  }
}

Widget CustomAppBar(BuildContext context) {

  return  new Container(
      width: MediaQuery.of(context).size.width,
      child:new Stack(children: <Widget>[
        new GestureDetector(
          onTap:(){
              Navigator.pop(context);
          },
          child: new Icon(Icons.arrow_back_ios,color: Colors.white,size: 25,),
        ),
        new Column(
          children: <Widget>[
            new Container(
              height: MediaQuery.of(context).padding.top,
              color: Color.fromRGBO(244, 14, 8, 1),
              //duration: Duration(milliseconds: 100),
            ),
            new Container(
                height: 60,
                //duration: Duration(milliseconds: 100),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(244, 14, 8, 1),

                ),

                child: new Center(
                  child: new Image.asset("assets/unlem@3x.png"),
                )),

          ]),
    ])
  );
}

class PDFScreen extends StatelessWidget {
  //String pathPDF = "";
  WebViewState parent;
  PDFScreen(this.parent);

  @override
  Widget build(BuildContext context) {

    return PDFViewerScaffold(
        appBar:  new AppBar(
          backgroundColor:  Color.fromRGBO(244, 14, 8, 1),
          title: new Container(margin: EdgeInsets.only(left: MediaQuery.of(context).size.width/2- MediaQuery.of(context).size.width/3.50) ,child: new Image.asset("assets/unlem@3x.png")),
        ),
        path: parent.pathPDF);
  }
}