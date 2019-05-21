import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class Catog{
  String title,route;
  List<Kose> koselist;
  Catog({this.title,this.route,this.koselist});




  factory Catog.fromJson(Map<String, dynamic> json) {
    var list = json['koseyazilari'] as List;
    List<Kose> Koselist = list.map((i) => Kose.fromJson(i)).toList();

    //print(list.runtimeType); //returns List<dynamic>
    // print(imagesList);

    return Catog(
      route: json['route'] as String,
      title: json['name'] as String,
      koselist:  Koselist,

    );
  }




}

class Kose{

  var okunma,link,author,title,icerik,dislike,like;
  Kose({this.okunma,this.link,this.author,this.title,this.icerik,this.dislike,this.like});

  factory Kose.fromJson(Map<String, dynamic> json) {


    //print(list.runtimeType); //returns List<dynamic>
    // print(imagesList);

    return Kose(
      okunma: json['okunma'] as int,
      title: json['title'] as String,
      link: json['link'] as String,
      icerik: json['icerik'] as String,
      author: json['author'] as String,
      like: json['like'] as int,
      dislike: json['dislike'] as int,

    );
  }

}
class Koses{
}

class Catogs{

    static List<Catog> dergilist;


  static Future<List<Catog>> getlist() async{
    if(dergilist == null){
      var parsedfetch = await fetchPhotos();
      dergilist = parsedfetch;
      return parsedfetch;

    }else{

      return dergilist;

    }
  }


  static List<Catog> parsePhotos(String responseBody) {

    try {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Catog>((json) => Catog.fromJson(json)).toList();
    }catch(e){
      print("kose parse failed");
      return [].toList();
    }
  }
  static Future<List<Catog>> fetchPhotos() async {
    final response = await http.get('http://31.186.23.166/konular');
    print(response.body);

    return parsePhotos(response.body);
  }





}