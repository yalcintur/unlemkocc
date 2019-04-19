import './video.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class VideoDao {

  static List<Video> videos;

  static List<Video> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Video>((json) => Video.fromJson(json)).toList();
  }
  static Future<List<Video>> fetchPhotos() async {
    final response =
    await http.get('http://31.186.23.166/expired');
    print(response.body);

    return parsePhotos(response.body);
  }


  static  Future<List<Video>> dergicallback() async{

    if(videos == null){
      var parsedfetch = await fetchPhotos();
      videos = parsedfetch;
      return parsedfetch;

    }else{

      return videos;

    }
  }


  static Future<List<Video>> refreshList() async {
    var fetched = await fetchPhotos();
    videos = fetched;
    return fetched;
  }




    static Video getvideobyid(id) {
    return videos
        .where((p) => p.id == id)
        .first;
  }
}




class WillExpire{

  static Video wexpvideo;

  static Video parsePhotos(String responseBody) {
    Map jsonresp = jsonDecode(responseBody);

    Video responseObj = Video(
      id: jsonresp['_id'],
      title: jsonresp['name'],
      expdate: jsonresp['expireDate'],
    );

    return responseObj;

  }
  static Future<Video> fetchPhotos() async {
    final response =
    await http.get('http://31.186.23.166/willexpire');
    print(response.body);

    return parsePhotos(response.body);
  }
  static  Future<Video> dergicallback() async{

    if(wexpvideo == null){
      var parsedfetch = await fetchPhotos();
      wexpvideo = parsedfetch;
      return wexpvideo;

    }else{

      return wexpvideo;

    }
  }
}