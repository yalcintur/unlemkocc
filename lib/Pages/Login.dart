import 'package:flutter/material.dart';
import '../Pages/splash.dart';
import '../Algorithms/httpPost.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login> {

  TextEditingController _emailcont = TextEditingController();
  TextEditingController _passcont = TextEditingController();
  TextEditingController _registercont = TextEditingController();
  bool poppedUp = false,loggedIn= false;


   RegisterDialog(){
    return showDialog(context: context,barrierDismissible:true, builder:  (BuildContext contextt){
      return AlertDialog(

        title: new Text("Emailini Aşağı Yazmak İstiyosun"),
        content: //new LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints){

          new SingleChildScrollView(
            child: new Center(
              child: new Row( children : <Widget> [
                new Expanded(

                    child: new Container(
                  height: 50.0,

                  decoration: BoxDecoration(
                    border: new Border.all(color: Color.fromRGBO(0, 0, 0,0.5),width: 1),
//                    boxShadow: [
//                      BoxShadow(
//                       // color : Colors.black,
//                        blurRadius: 2,
//                      ),
//                    ]

                  ),
                  child: new TextField(controller: _registercont,keyboardType: TextInputType.emailAddress,decoration: InputDecoration(hintText: "Okul Emaili"),),
                )),
                new GestureDetector(
                  onTap: (){
                    final snackBar010 = SnackBar(content: Text('Email boş bırakılamaz'));
                             // print(_registercont.text);
                    if(_registercont.text != ""){
                      Register(_registercont.text, contextt);}else {
                      mScaffoldState.currentState.showSnackBar(snackBar010);

                    }
                  },
                  child: new Container(
                    decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: new Color.fromRGBO( 244,14 ,8,1),

                    ),
                    margin:  EdgeInsets.only(left: 8),
                    width: 50,
                    height: 50,
                    child: new Icon(Icons.send,color: Colors.white,),
                  ),
                )



              ]),
            )
          )



      );

    });
  }

  setLocalUser(var email, var password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("userEmail", email);
    await prefs.setString("userPassword", password);
    await prefs.setBool("loginStatus", true);

  }

  void navigateScreen(BuildContext context){
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return Splash();
    }));
  }

  void OpenRegi(){
    setState(() {
      poppedUp = true;
    });
  }
  void CloseRegi(){
    setState(() {
      poppedUp = false;
    });
  }

  Future<String> Register(var email,BuildContext cont)async{
    final snackBar200 = SnackBar(content: Text("Şifreni Emailine Attık. Hadi Yine İyisin"));
    final snackBar11000 = SnackBar(content: Text("Görünüşe Göre Zaten Kayıtlısın. Kesin Unutmuşsundur, 123 Dene"));


    var response =  await LoginHttp.RegisterEmail(email);
    if(response == 200){
      mScaffoldState.currentState.showSnackBar(snackBar200);
    }else if(response == 11000){
      mScaffoldState.currentState.showSnackBar(snackBar11000);

    }
    Navigator.pop(cont);


  }




  Future<String> QuerryDATA(BuildContext context) async{
    final snackBar404 = SnackBar(content: Text('Giriş  işleminde bir hata oluştu... Aga be '));
    final snackBar500 = SnackBar(content: Text('Email veya şifreniz yanlış. Ağlayabilirsiniz'));
    final snackBar000 = SnackBar(content: Text('Email veya şifreyi boş bırakamazsınız. Yer Mi Anadolu Çocuğu?'));


    print(_emailcont.text);
    if(_emailcont.text != "" && _passcont.text != ""){
    var response =  await LoginHttp.QueryData(_emailcont.text, _passcont.text);

    if(response == 200){
        setLocalUser(_emailcont.text, _passcont.text);
        navigateScreen(context);
    }else if(response == 500) {
      mScaffoldState.currentState.showSnackBar(snackBar500);

    }else {
      mScaffoldState.currentState.showSnackBar(snackBar404);

    }
  }else{


      mScaffoldState.currentState.showSnackBar(snackBar000);

    }
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final GlobalKey<ScaffoldState> mScaffoldState = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    double logoWidth =(73*MediaQuery.of(context).size.width)/125;
    double logoHeight = logoWidth;
    double elewidth = 60;

    return Material(
      child: Scaffold(
        key: mScaffoldState,
       // resizeToAvoidBottomPadding: false,
       body:new Container( height:  MediaQuery.of(context).size.height,width:MediaQuery.of(context).size.width ,child: new SingleChildScrollView(child:
          new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: <Widget>[
            new Container(child : new Column(children: <Widget>[
            Container(
                margin:EdgeInsets.only(top: MediaQuery.of(context).padding.top+20),
                  //color: Colors.green[400],
                  child: new Stack(
                    children: <Widget>[
                      Center(
                        child: new Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(244,14,8,1

                            ),
                            borderRadius: BorderRadius.circular(logoWidth/2),
                          ),
                          width: logoWidth,
                          height: logoHeight,
                        ),
                      ),
                      Center(
                        child: new Image.asset(
                          'assets/logo@3x.png',
                          width: logoWidth-40,
                          height: logoHeight ,
                        ),
                      ),
                    ],
                  )
              ),
            Container(height: 20,),

            Container(
                  // color: Colors.pink[100],
                  child: Center(
                    child: new Image.asset(
                      'assets/nlem@3x.png',
                      width: logoWidth-60,
                    ),
                  )
              ),
              Container(height: MediaQuery.of(context).size.height/11,),
            ])),
            new Flexible(

             child:  Container(
                width: (270* MediaQuery.of(context).size.width)/375,
                child:Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Container(height: (50*(270* MediaQuery.of(context).size.width)/375)/270+5, decoration:  BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,0.5),blurRadius: 3),]),margin: EdgeInsets.only(bottom: 8.0),
                      child: new Column(
                        children: <Widget>[
                          new Align( alignment:  Alignment.topLeft,child:new Container(margin: EdgeInsets.only(top: 2,left: 4),child:  new Text("EMAİL",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "DINCondensed-Bold"),))),
                          new SizedBox(height: (50*(270* MediaQuery.of(context).size.width)/375)/270-20 ,child: TextField(controller: _emailcont,  autofocus: true,
                          ),)
                        ],
                      ),

                    ),
                    new Container(height: (50*(270* MediaQuery.of(context).size.width)/375)/270+5, decoration:  BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(color: Color.fromRGBO(0,0,0,0.5),blurRadius: 3),]),margin: EdgeInsets.only(bottom: 8.0),
                      child: new Column(
                        children: <Widget>[
                          new Align( alignment:  Alignment.topLeft,child:new Container(margin: EdgeInsets.only(top: 2,left: 4),child:  new Text("ŞİFRE",style: TextStyle(fontWeight: FontWeight.bold,fontFamily: "DINCondensed-Bold"),))),
                          new SizedBox(height: (50*(270* MediaQuery.of(context).size.width)/375)/270-20 ,child: TextField(  autofocus: true,
                            controller: _passcont,),)                         ],
                      ),

                    ),

                    new Container(height: (60*(270* MediaQuery.of(context).size.width)/375)/270-10,color: Color.fromRGBO(244,14,8,1),

                    child: new GestureDetector(
                      onTap: () {
                        QuerryDATA(context);

                      },
                      child: new Center(
                        child: new Text("GİRİŞ YAP",style: TextStyle(fontFamily: "DINCondensed-Bold",color: Colors.white,fontSize: 30),),
                      ),
                    ),

                    ),
                    new Container(height: 20,),
                    new GestureDetector(
                      onTap: (){
                        RegisterDialog();
                        },
                      child: new Text("İlk Girişin mi?",style: TextStyle(color: Colors.black,fontFamily: 'DINCondensedBold', fontSize: 25.0),),
                    )

                  ],
                )),
              )),

          ],

          )))));
  }

}