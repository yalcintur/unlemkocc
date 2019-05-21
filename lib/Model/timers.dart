import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Timerrr{
  final String id;
final String enddate;
final String title;
final String expiredtext;

  const Timerrr({this.enddate,this.title,this.expiredtext,this.id});

factory Timerrr.fromJson(Map<String, dynamic> json) {
  return Timerrr(
    id: json['_id'] as String,
    enddate: json['endDate'] as String,
    expiredtext: json['expTitle'] as String,
    title: json['title'] as String,
  );
}

}

class Timers{



  static List<Timerrr> Timerrrlist;
  static List<Timerrr> parsePhotos(String responseBody) {
    try {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
      print(parsed);
      return parsed.map<Timerrr>((json) => Timerrr.fromJson(json)).toList();
    }catch(e){
      print("Timer parse failed");
    }
  }
  static Future<List<Timerrr>> fetchPhotos() async {
    final response =
    await http.get('http://31.186.23.166/sayac');
    print(response.body);

    return parsePhotos(response.body);
  }

  static  Future<List<Timerrr>> Timerrrcallback() async{

    if(Timerrrlist == null){
      var parsedfetch = await fetchPhotos();
      Timerrrlist = parsedfetch;
      return parsedfetch;

    }else{

      return Timerrrlist;

    }
  }
  
  
  

  static final List<Timerrr> Timerrrs = [
    const Timerrr(
      enddate: "2019-04-19 11:23:30",
      title: "Sevgi Gönül",
      expiredtext: "helal",
    ),
    const Timerrr(
      enddate: "2019-05-11 10:10:30",
      title: "Okulların Kapanması",
      expiredtext: "helal",
    ),
    const Timerrr(
      enddate: "2019-04-24 11:23:30",
      title: "STFU YOU MOTHER SHİT..............",
      expiredtext: "helal",
    ),
    const Timerrr(
      enddate: "2019-02-01 11:23:30",
      title: "Common Exams",
      expiredtext: "Sınavlar Başladı!!",
    ),
    const Timerrr(
      enddate: "2019-05-04 13:40:00",
      title: "Ünlem Launch",
      expiredtext: "Ünlem BAŞLASIN!!",
    ),

  ];
}