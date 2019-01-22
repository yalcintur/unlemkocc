import 'package:flutter/material.dart';
import '../Components/kosetile.dart';
import '../Theme.dart' as Theme;


class Koseler extends StatefulWidget {
  _KoselerState createState() => _KoselerState();
}

class _KoselerState extends State<Koseler> {
  //List<String> koselist = [""];

  @override
  Widget build(BuildContext context) {
    return new Container(color: Theme.Colors.pagebackground,child:  new ListView.builder(
  padding: EdgeInsets.all(8.0),
  
  itemExtent: 132.0,
  itemCount: dergis.length,
  itemBuilder: (BuildContext context, int index) {
    return Kosetile(dergis[index].image, dergis[index].kosebaslik, dergis[index].koseicerik);
  },
    ));
  }
  //!!!!!!!!!!!!!!!!!!!!!!!!!!! Yukardaki Listeyi ekle ve indexe göre şey yap işte yaparsın aslansın
  static final List<Kose> dergis = [
    const Kose(
      
      image: "assets/renaisance.png",
      kosebaslik: "FELSEFE KÖŞESİ",
      koseicerik: "Yazarın adı soyadı",     
    ),
    const Kose(
      
      image: "assets/vincent.png",
      kosebaslik: "SANAT KÖŞESİ",
      koseicerik: "Sanat falan",     
    ),
    const Kose(
      
      image: "assets/usain.png",
      kosebaslik: "SPOR KÖŞESİ",
      koseicerik: "123",     
    ),
    const Kose(
      
      image: "assets/book.png",
      kosebaslik: "EDEBİYAT KÖŞESİ",
      koseicerik: "Kötü Çocuk okuyun çok güğzel",     
    ),
  ];
}




class Kose {
  
  final String kosebaslik;
  final String image;
  final String koseicerik;
  const Kose({this.image, this.kosebaslik, this.koseicerik});
}

