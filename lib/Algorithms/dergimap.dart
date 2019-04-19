import '../Model/dergis.dart';
import 'package:flutter/material.dart';

class Dimension{

  double width,height;

  Dimension(this.width,this.height);

}

class mapp {
  List<int> findremainder(int number) {
    if (number % 2 == 1) {
      List<int> arg = [number ~/ 2, 0];
      return arg;
    } else
      return [11, 1];
  }

  List<int> pickfirst() {
    int listlenght= DergiDao.dergis.length;
    if (findremainder(listlenght) == 1) {
      List<int> grow;

      for (var i = 0; i <listlenght ; i+2) {
        grow.add(i);
      }
    }
  }
}

class DergiGraph  {




  static MediaQueryData queryData;

  static List<double> bosluk(BuildContext context) {
    queryData = MediaQuery.of(context);
    double ortaboslukartani,ilkartan,sonartan,ortaartan;
    double blankwidth = queryData.size.width - 48;
    if (blankwidth % 2 == 0) {
      //16 bölünebliyor tüm sayfa
      return [16, 16, 16];
    } else {
      ortaboslukartani = blankwidth % 2;
      if(ortaboslukartani %3 == 0){
        ilkartan = ortaboslukartani/3;
        sonartan = ortaboslukartani/3;
        ortaartan = ortaboslukartani/3;

        return[ilkartan,ortaartan,sonartan];
      }else{
        ortaartan = ortaboslukartani%3;
        ortaboslukartani-= ortaartan;
        ilkartan = ortaboslukartani/3;
        sonartan = ortaboslukartani/3;
        ortaartan += ortaboslukartani/3;

        return [16+ilkartan, 16 + ortaartan, 16+sonartan];
      }

    }
  }


  static List<double> elementDimens(BuildContext context){
    double boslukwidth = 0;
    int heightint;

    double width,height;
    for(int i = 0;i< 3;i++){
   //   print(bosluk(context)[i]);
      boslukwidth += bosluk(context)[i];
    }

    width = (queryData.size.width-boslukwidth)/2;//+(bosluk(context)[1]/2);

    heightint = (222.0* width) ~/ 163.0;
    height = heightint.toDouble();

//    return[163,222];
    return [width,height];

  }

  }

  class TabAlgorithm{

    static double ratioAlgorithm(double a1, double a2,double b2,){
     // print("$a1 $a2 $b2");
      int b1 = (a1*b2)~/ a2;
    //  print(b1);
      return b1.toDouble();
    }
  }

  class HomeAlgorithm{
    static MediaQueryData queryData;
    static int objectwidth,objectheight;
    static Dimension Crousel(BuildContext context){
      queryData = MediaQuery.of(context);
        objectwidth = queryData.size.width.toInt() - 50;

      objectheight = (420*objectwidth)~/300;
      return Dimension(objectwidth.toDouble(),objectheight.toDouble());
    }
  }


  class KoselerAlgorithm{



    static double calculateposition(double itemsize,double offet,int position){

      if((itemsize*(position+1))-offet > 0){
        return offet + ((itemsize*(position+1))-offet)- itemsize;
      }else{
        var a = ((itemsize*(position+1))-offet);
        return offet - a.abs()-itemsize;
      }

    }
  }



  class RopoAlg{


    static Dimension calculatebox(BuildContext context){
      double screenwidth = MediaQuery.of(context).size.width;
      double screenheight = MediaQuery.of(context).size.height;

      double boxwidth = (358*screenwidth)/411;
      double boxheight = (343*boxwidth)/358;

      return Dimension(boxwidth,boxheight);


    }

    static double calculateTile(double height){


      return (285*height)/343;



    }

  }