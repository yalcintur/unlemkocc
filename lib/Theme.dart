import 'package:flutter/material.dart';

class Colors {
  const Colors();

  //static const Color splashbackground = const Color(0xFF5fb7ed);
  static const Color tabbarbackground = const Color(0xFFf40e08);
  static const Color dergigray = const Color(0xFFd8d8d8);
  static const Color pagebackground = const Color(0xFFd10000);
  static const Color roportajheroborder = const Color(0xFF8A0000);
  static const Color stackvideostopbar = const Color(0xFF8a0000);
}

class Dimens {
  const Dimens();

  // static const planetWidth = 100.0;
  // static const planetHeight = 100.0;
}

class TextStyles {
  const TextStyles();

  //

  static const TextStyle kosebas = const TextStyle(
      color: Color(0xFFffffff), fontFamily: 'Impact', fontSize: 45.0);
  static const TextStyle KoseTitle = const TextStyle(
      color: Color(0xFFffffff), fontFamily: 'Impact', fontSize: 25.0,shadows: <Shadow>[
    Shadow(
      offset: Offset(2.0, 5.0),
      blurRadius: 16.0,
      color: Color(0xFF000000),
    ),],
  );
  static const TextStyle ropsayacc = const TextStyle(
      color: Color(0xFFffffff), fontFamily: 'Impact', fontSize: 15.0);
  static const TextStyle ropsayaccint = const TextStyle(
      color: Color(0xFFffffff), fontFamily: 'Impact', fontSize: 30.0);
  static const TextStyle koseice = const TextStyle(
      color: Color(0xFFffffff), fontFamily: 'Impact', fontSize: 20.0,);
  static const TextStyle koseyazar = const TextStyle(
      color: Color(0xFFffffff), fontFamily: 'Impact', fontSize: 18.0,shadows: <Shadow>[
    Shadow(
      offset: Offset(2.0, 5.0),
      blurRadius: 16.0,
      color: Color(0xFF000000),
    ),],);
  static const TextStyle stackvideotitle = const TextStyle(
      color: Color(0xFFffffff), fontFamily: 'Impact', fontSize: 23.0);
  static const TextStyle timerfont = const TextStyle(
      color: Color(0xFFffffff), fontFamily: 'DINCondensedBold', fontSize: 40.0);
  static const TextStyle detailpagetitle= const TextStyle(
      color: Color(0xFFffffff), fontFamily: 'DINCondensedBold', fontSize: 41.0);
  static const TextStyle detailpagetiletitle= const TextStyle(
      color: Color(0xFFffffff), fontFamily: 'DINCondensedBold', fontSize: 30.0);
  static const TextStyle detailpagetilecapital= const TextStyle(
      color: Color(0xFF000000), fontFamily: 'DINCondensedBold', fontSize: 30.0);
  static const TextStyle navElementTitle= const TextStyle(
      color: Color(0xFFffffff), fontFamily: 'DINCondensedBold', fontSize: 25.0);
  static const TextStyle navElementTitleHighLit= const TextStyle(
      color: Colors.pagebackground, fontFamily: 'DINCondensedBold', fontSize: 25.0,decoration: TextDecoration.underline, decorationColor: Color.fromRGBO(244,14,8,100));

}
