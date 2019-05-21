import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Carousell{
  var id,link;
  Carousell({this.id,this.link});

  factory Carousell.fromJson(Map<String, dynamic> json) {


    // print(imagesList);

    return Carousell(
      id: json['_id'] as String,
      link: json['link'] as String,
    );
  }



}
class Carousells{

  static List<Carousell> carolist;

  static List<Carousell> parsePhotos(String responseBody) {
    try {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Carousell>((json) => Carousell.fromJson(json)).toList();
    }catch(e){
      print("Carousel parse failed");
      return [].toList();
    }
  }
  static Future<List<Carousell>> fetchPhotos() async {
    final response =
    await http.get('http://31.186.23.166/carousel');
    print(response.body);

    return parsePhotos(response.body);
  }


  static  Future<List<Carousell>> Carousellcallback() async{

    if(carolist == null){
      var parsedfetch = await fetchPhotos();
      carolist = parsedfetch;
      return parsedfetch;

    }else{

      return carolist;

    }
  }


  static Future<List<Carousell>> refreshList() async{
    var fetched = await fetchPhotos();
    carolist = fetched;
    return fetched;
  }





}