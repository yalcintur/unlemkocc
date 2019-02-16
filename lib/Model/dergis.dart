import './dergi.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
class DergiDao {

  static String responsee;
  static Future<String> _loadAsset() async {
    final response =
    await http.get('https://serene-ocean-55516.herokuapp.com/dergiler');
    if (response.statusCode == 200) {
      responsee = response.body;
      return response.body;

      // If server returns an OK response, parse the JSON
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
  }

  static Dergi fetchPost(){
    _loadAsset();
    Map dergiMap = jsonDecode(responsee);
    var dergi = new Dergi.fromJson(dergiMap);

    print(dergi.info);

  }


//  static Future<Dergi> fetchPost() async {
//    String response = await _loadAsset();
//
//    print(response);
//    Map dergiMap = json.decode(response);
//    return Dergi.fromJson(dergiMap);
//
//
//
////    if (response.statusCode == 200) {
////      // If server returns an OK response, parse the JSON
////      return Dergi.fromJson(json.decode(response.body));
////    } else {
////      // If that response was not OK, throw an error.
////      throw Exception('Failed to load post');
////    }
//  }



  static  List<Dergi> dergicallback(){
     fetchPost();
     return dergis;

  }
  static Future<List<Dergi>> initilizeList() async{

    Dergi dergi = await fetchPost();
    print(dergi.info);
    dergis.add(dergi);
    
  //  print(dergis.length);


  }



static List<Dergi> dergis;
//  static  List<Dergi> dergis = [
//    const Dergi(
//      id: "1",
//      name: "Boyut",
//      image: "assets/tawa@3x.png",
//
//
//    ),
//     const Dergi(
//      id: "1",
//      name: "Boyut",
//      image: "assets/dive@3x.png",
//
//
//    ),
//     const Dergi(
//      id: "1",
//      name: "Boyut",
//      image: "assets/boyutkapak@3x.png",
//
//
//    ),
//    const Dergi(
//      id: "1",
//      name: "Boyut",
//      image: "assets/tawa@3x.png",
//
//    ),
//     const Dergi(
//      id: "1",
//      name: "Boyut",
//      image: "assets/dive@3x.png",
//
//
//    ),
//     const Dergi(
//      id: "1",
//      name: "Boyut",
//      image: "assets/boyutkapak@3x.png",
//
//
//    ),
//    const Dergi(
//      id: "1",
//      name: "Boyut",
//      image: "assets/tawa@3x.png",
//
//
//    ),
//     const Dergi(
//      id: "1",
//      name: "Boyut",
//      image: "assets/dive@3x.png",
//
//
//    ),
//     const Dergi(
//      id: "1",
//      name: "Boyut",
//      image: "assets/boyutkapak@3x.png",
//
//
//    ),
//  ];

  static Dergi getPlanetById(id) {
    return dergis
        .where((p) => p.id == id)
        .first;
  }
}