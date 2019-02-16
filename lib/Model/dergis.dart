import './dergi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class DergiDao {

  static List<Dergi> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Dergi>((json) => Dergi.fromJson(json)).toList();
  }
  static Future<List<Dergi>> fetchPhotos() async {
    final response =
    await http.get('https://arcane-crag-49959.herokuapp.com/dergiler');

    return parsePhotos(response.body);
  }

  static  Future<List<Dergi>> dergicallback() async{
    var parsedfetch = await fetchPhotos();
   return parsedfetch;
  //  print(parsedfetch[0].info);
  }
  static List<Dergi> dergis;

  static Dergi getPlanetById(id) {
    return dergis
        .where((p) => p.id == id)
        .first;
  }
}