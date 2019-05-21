import './detailBar.dart';
import './dergis.dart';
import 'dart:async';
import 'dart:convert';

class DetailBars {
  static final List<Detail> details = [
    const Detail(
      id: "1",
      title: "Boyut",
      link: "https://www.brookfield.hants.sch.uk/subpage-content/content-pdfs/exams11/English/Modern%20Text/An%20Inspector%20Calls_text.pdf",
    ),
    const Detail(
      id: "2",
      title: "EKİM 25 SAYISI",
      link: "https://drive.google.com/uc?export=download&id=1n7DOSPHJudPkIjkvJtNctfe-BfRMEmKf",
    ),
    const Detail(
      id: "3",
      title: "Boyut 48 ekim ",
      link: "https://drive.google.com/uc?export=download&id=1Ca5jFeruoVzb6E2xgwYbNqSA6PvBi0wW",
    ),
    const Detail(
      id: "4",
      title: "annen",
      link: "https://drive.google.com/uc?export=download&id=1wBwgSv6S5LgrR_693DfwJXuN6ii4p4UW",
    ),
  ];

  static List<Detail> parsePhotos(String responseBody) {
    try {
      final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

      return parsed.map<Detail>((json) => Detail.fromJson(json)).toList();
    }catch(e){
      print("DergiDetail parse failed");
    }
  }

  static Future<List<Detail>> callback(int index) async{
    var detailsraw =  await DergiDao.dergicallback();
    //print(detailsraw.toString());
    var dertailinstep = detailsraw[index].linkler;

  //print(dertailinstep[0].title);
   // var parsedlist = parsePhotos(dertailinstep.toString());


    return dertailinstep;

  }




}
