import './dergi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class DergiDao {
  static List<Dergi> dergilist;
  static List<Dergi> parsePhotos(String responseBody) {
    try {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Dergi>((json) => Dergi.fromJson(json)).toList();
    }catch(e){
      print("Dergi parse failed");
      return [].toList();
    }
  }
  static Future<List<Dergi>> fetchPhotos() async {
    final response =
    await http.get('http://31.186.23.166/dergiler');
    print(response.body);

    return parsePhotos(response.body);
  }

  static  Future<List<Dergi>> dergicallback() async{

    if(dergilist == null){
      var parsedfetch = await fetchPhotos();
      dergilist = parsedfetch;
      return parsedfetch;

    }else{

      return dergilist;

    }
  }


  static Future<List<Dergi>> refreshList() async{
    var fetched = await fetchPhotos();
    dergilist = fetched;
    return fetched;
  }

  static List<Dergi> dergis;

  static Dergi getPlanetById(id) {
    return dergis
        .where((p) => p.id == id)
        .first;
  }
}